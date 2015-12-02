require 'pry-byebug'
require 'sinatra'
require 'sinatra/contrib/all' if development?
require 'pg'

get '/tasks' do
  # get all tasks from DB
end

get '/tasks/new' do
  # get form to create new task with
end

post '/tasks' do
  # create new task, persistent in DB
end

get '/tasks/:id' do
  # gets individual task
end

get '/tasks/:id/edit' do
  # edits individual task, commits to DB
end

post '/tasks/:id' do
  # updates individual task :id in DB
end

post '/tasks/:id/delete' do
  # destroy in DB
end