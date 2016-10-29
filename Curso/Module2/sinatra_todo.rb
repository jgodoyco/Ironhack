class Todolist
	attr_reader :tasks, :nameList
    
    def initialize (name)
        @tasks = []
        @nameList = name
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
    	return @completed = true
    end

    def make_incompleted!
    	return @completed = false
    end

    def update_content! (newContent)
    	@content = newContent
    	@updated_at = (Time.new).inspect
    end

    def to_s
    	return "TASK[#{@id}]:'#{@content}', TIME:#{@updated_at}"
    end
end
