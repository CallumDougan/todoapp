require 'pry-byebug'
require 'sinatra'
require 'sinatra/contrib/all' if development?
require 'pg'

get '/tasks' do
  sql = "SELECT * FROM tasks"
  @tasks = run_sql(sql)
  erb :index
end

get '/tasks/new' do
  # get form to create new task with
  erb :new
end

post '/tasks' do
  name = params[:name]
  details = params[:details]

  sql = "INSERT INTO tasks (name, details) VALUES ('#{name}', '#{details}')"
  run_sql(sql)
  redirect to('/tasks')
end

get '/tasks/:id' do
  sql = "SELECT * from tasks WHERE id = #{params[:id]}"
  @return = run_sql(sql)
  erb :show
end

get '/tasks/:id/edit' do
  # edits individual task, commits to DB
  @id = params[:id]
  sql = "SELECT * from tasks WHERE id = #{params[:id]}"
  @task = run_sql(sql).first

  erb :edit
end

post '/tasks/:id' do
  # updates individual task :id in DB
  name = params[:name]
  details = params[:details]
  sql = "UPDATE tasks SET name = '#{name}', details = '#{details}' WHERE id = #{params[:id]}"
  run_sql(sql)
  redirect to('/tasks')
end

post '/tasks/:id/delete' do
  # destroy in DB
end

def run_sql(sql)
  conn = PG.connect(dbname: 'to_do', host: 'localhost')
  result = conn.exec(sql)
  conn.close
  result
end