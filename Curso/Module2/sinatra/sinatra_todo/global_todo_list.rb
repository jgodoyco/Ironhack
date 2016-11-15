#Inside of server.rb
require 'sinatra'
require 'sinatra/reloader'
# We're going to need to require our class files
require_relative('lib/sinatra_todo.rb')

enable(:sessions)

@@todo_list = Todolist.new("Josh")
@@todo_list.load_tasks
puts @@todo_list.inspect
puts @@todo_list.tasks.length

get '/' do
  redirect ('/tasks')
end

get '/tasks' do
  @todo = @@todo_list
  erb(:task_index)
end

get '/new_task' do
  @todo = @@todo_list
  erb(:new_task)
end

post '/create_task' do
  @@todo_list.add_task(Task.new(params[:content]))
  @@todo_list.save_tasks
  redirect ('/')
end

get '/complete_task/:id' do
  id_task_to_complete = @@todo_list.find_task_by_id (params[:id].to_i)
  task_to_complete = @@todo_list.tasks[id_task_to_complete]
  if (task_to_complete!=nil) 
  	task_to_complete.completed!
  	@@todo_list.save_tasks
  end
  redirect ('/')
end

post '/delete_task' do
	@@todo_list.delete_task(params[:id_task].to_i)
	@@todo_list.save_tasks
	redirect ('/')
end