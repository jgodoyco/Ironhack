require "yaml/store"
require "pry"


class Todolist
	attr_reader :tasks, :nameList, :todo_store
	@file_path
    
    def initialize (user)    	
        @tasks = []
        @nameList = user
        #to test local
        #@file_path= "../public/tasks_#{nameList}.yml"
        @file_path= "./public/tasks_#{nameList}.yml"
    end

    def save_tasks
      if File.exists?(@file_path)
      	File.delete(@file_path)
      end

      @todo_store = YAML::Store.new(@file_path)

	  @todo_store.transaction do 
      	@todo_store[@nameList] = @tasks
  	  end
	end

	def load_tasks
	  if File.exists?(@file_path)
		@todo_store = YAML.load_file(@file_path)
		id = 1
		@tasks=[]
		@todo_store[@nameList].each do |task|
			@tasks << task
			id +=1
  	  	end
  	  	Task.set_current_id(id)
  	  end
  	  puts tasks
	end

	def add_task(task_to_add)
		valueRet = nil
		if (!(@tasks.include?(task_to_add))&&(task_to_add != nil))
			@tasks  << task_to_add
			valueRet = task_to_add.id
		end
		return valueRet

	end

	def delete_task(id_task_to_delete)
		valueRet = false
		puts id_task_to_delete
		if (id_task_to_delete != nil)
			arrayIndexTask = find_task_by_id(id_task_to_delete)
			if(arrayIndexTask != nil)
				@tasks.delete_at(arrayIndexTask)
				valueRet = true
			end
		end
		return valueRet
	end

	def find_task_by_id (id_task_to_find)
		return  id_task_to_find!=nil ? @tasks.find_index {|task| task.id == id_task_to_find} : nil
	end

	def include?(task)
		return task!= nil ? @tasks.include?(task) : false
	end

	def includeTaskWithId?(id)
		return id!= nil ? @tasks.any? {|task| task.id == id} : false
	end
	
	def sort_by_created
		return sorted_tasks = @tasks.sort { | task1, task2 | task1.created_at <=> task2.created_at }
	end

	def to_s
		s = "[#{@nameList}] -->"
		@tasks.each do |task|
			puts task.class
			s+= task.to_s
		end
		return s
	end
	
end

class Task
    attr_reader :content, :id, :completed, :created_at, :updated_at 
    #static class variable
    @@current_id = 1

    def initialize(content)
        @content = content
        @id = @@current_id
        @@current_id += 1
        @completed = false	
        @created_at = (Time.new).inspect
        @updated_at = nil
    end

    def completed?
    	return @completed
    end

    def completed!
    	@updated_at = (Time.new).inspect
    	return @completed = true
    end

    def make_incompleted!
    	@updated_at = (Time.new).inspect
    	return @completed = false
    end

    def update_content! (newContent)
    	@content = newContent
    	@updated_at = (Time.new).inspect
    end

    def self.set_current_id(start_id)
    	@@current_id =start_id
    end

    def self.get_current_id
    	return @@current_id
    end

    def to_s
    	return "TASK[#{@id}]:'#{@content}', TIME:#{@updated_at}"
    end
end


# Graba tareas
	#todo_list = Todolist.new("Josh")
	#task = Task.new("Walk the dog")
	#task2 = Task.new("Buy the milk")
	#task3 = Task.new("Make my todo list into a web app")
	#todo_list.add_task(task)
	#todo_list.add_task(task2)
	#todo_list.save_tasks

	#todo_list2 = Todolist.new("Mary")
	#task = Task.new("Buy the bread")
	#task2 = Task.new("Drink Water")
	#todo_list2.save

#Recupoera Tareas
	#todo_list = Todolist.new("Josh")
	#puts todo_list.tasks.length
	#puts todo_list.inspect
	#todo_list.load_tasks

	#task = Task.new("Buy flowers")
	#todo_list.add_task(task)
	#todo_list.save_tasks
	#puts todo_list.inspect
	#puts todo_list.tasks.length

	#puts Task.get_current_idcd