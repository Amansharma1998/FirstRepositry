require_relative "task_method.rb"
require_relative "csvexport.rb"
require_relative "task.rb"

class TaskManager
  include CsvExport
  include TaskMethod
  def initialize
    @tasks = [] 
    @task_id = 1
  end
 
  def main
    puts "Welcome to the Task Manager!"
puts "BE CREFULL"
    loop do
      puts "\nMain Menu:"
      puts "1. Add a task"
      puts "2. List tasks"
      puts "3. Update task"
      puts "4. Mark a task as complete"
      puts "5. Delete a task"
      puts "6. Export all tasks to CSV"
      puts "7. Search a task by title"
      puts "8. Exit"
      print "Please enter your choice: "
      choice = gets.chomp.to_i

      case choice
        when 1
          add_task()
        when 2
          list_tasks()
        when 3
          update_task()
        when 4
          mark_task_complete()
        when 5
          delete_task()
        when 6
          export_csv(@tasks)
        when 7
          search_task()
        when 8
          break
        else
          puts "Invalid choice. Please try again."
        end
      end
      puts "Thank you!"
  end

  def add_task()
    description = nil
    
    3.times do |attempts|
    print "Enter the description of the task: "
    description = gets.chomp
    break unless description.empty?
    puts "Discription cannot be empty "
    end 

    if description.empty?
      puts "failed to add task "
      return 
    end 

    task = Task.new(@task_id, description)
    @tasks << task
    @task_id += 1
    puts "Task added successfully!"
  end
end

taskmanager = TaskManager.new
taskmanager.main
