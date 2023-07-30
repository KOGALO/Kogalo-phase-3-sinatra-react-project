require 'sinatra'
require 'sinatra/activerecord'
require 'json'

# Database setup - replace 'database.db' with your desired database name
set :database, { adapter: "sqlite3", database: "database.db" }

class Todo < ActiveRecord::Base
  belongs_to :category
end

class Category < ActiveRecord::Base
  has_many :todos
end

# Create a new todo
post '/todos' do
    request_body = JSON.parse(request.body.read)
    todo = Todo.create(request_body)
    todo.to_json
  end
  
  # Read all todos
  get '/todos' do
    todos = Todo.all
    todos.to_json
  end
  
  # Update a todo
  patch '/todos/:id' do
    todo = Todo.find(params[:id])
    request_body = JSON.parse(request.body.read)
    todo.update(request_body)
    todo.to_json
  end
  
  # Delete a todo
  delete '/todos/:id' do
    todo = Todo.find(params[:id])
    todo.destroy
    { message: 'Todo deleted successfully' }.to_json
  end
  