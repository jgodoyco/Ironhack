require_relative "../sinatra_todo.rb"
require "spec_helper"
require "thread"

describe "Todolist" do 

	before :each do
		@list = Todolist.new("Jose")
		@task = Task.new "My Content task"
	end

	describe "#add_task" do
		it "returns 1 if the Task is added and is the first" do
			expect(@list.add_task(@task)).to eq(@task.id)
			expect(@list.include?(@task)).to eq(true)
		end

		it "returns nil if the Task is added two times" do
			@list.add_task(@task)
			expect(@list.add_task(@task)).to eq(nil)
		end

		it "returns false if the Task is not added" do
			expect(@list.add_task(nil)).to eq(nil)
			expect(@list.include?(@task)).to eq(false)
		end
	end

	describe "#include?" do
		it "returns false if the Task don't exist in the list" do
			expect(@list.include?(nil)).to eq(false)
		end
		it "returns true if the Task exist in the list" do
			@list.add_task(@task)
			expect(@list.include?(@task)).to eq(true)
		end
	end

	describe "#delete_task" do
		it "returns false if the Task don't exist in the list" do
			expect(@list.delete_task(@task.id)).to eq(false)
		end
		it "returns false if the Task don't exist in the empty list" do
			expect(@list.delete_task(nil)).to eq(false)
		end
		it "returns true if the Task exist in the empty list" do
			@list.add_task(@task)
			expect(@list.delete_task(@task.id)).to eq(true)
		end
	end

	describe "#find_task_by_id" do
		it "returns nil if the Task don't exist in the empty list" do
			expect(@list.find_task_by_id(nil)).to eq(nil)
		end
		it "returns nil if the Task don't exist in the list" do
			expect(@list.find_task_by_id(@task.id)).to eq(nil)
		end
		it "returns 0 if the Task exist in the list and is the first" do
			@list.add_task(@task)
			expect(@list.find_task_by_id(@task.id)).to eq(0)
		end
	end
	

	describe "#sort_by_created" do
		it "returns [] if the ordenated Task don't exist in the empty list" do
			expect(@list.sort_by_created()).to eq([])
		end

		it "returns [@task] if the ordenated Task has only a Task" do
			@list.add_task(@task)
			expect(@list.sort_by_created()).to eq([@task])
		end

		it "returns [@task2, @task1] if the ordenated Task has only a Task" do
			sleep 2
			@task2 = Task.new("Segunda Task")
			sleep 1
			@task3 = Task.new("Tercera Task")
			@list.add_task(@task2)
			@list.add_task(@task3)
			@list.add_task(@task)
			expect(@list.sort_by_created()).to eq([@task,@task2,@task3])
		end
	end
end

describe "Task" do 

	before :each do
		@task = Task.new "My Content task"
	end

	describe "#completed?" do
		it "returns false if the Task is new" do
			expect(@task.completed?).to eq(false)
		end
		it "returns true if the Task is completed" do
			@task.completed!
			expect(@task.completed?).to eq(true)
		end
	end

	describe "#make_incompleted?" do
		it "returns false if the Task is not completed" do
			@task.make_incompleted!
			expect(@task.completed?).to eq(false)
		end

		it "returns false if the Task is not completed" do
			@task.completed!
			@task.make_incompleted!
			expect(@task.completed?).to eq(false)
		end

		it "returns true if the Task is completed" do
			@task.make_incompleted!
			@task.completed!
			expect(@task.completed?).to eq(true)
		end
	end

	describe "#update_content!" do
		it "returns 'My Content task' that is the content of the Task default" do
			expect(@task.content).to eq("My Content task")
		end

		it "returns 'My NEW Content task' that is the content of the Task default" do
			@task.update_content!("My NEW Content task")
			expect(@task.content).to eq("My NEW Content task")
		end
	end

end