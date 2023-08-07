module TaskMethod

  def list_tasks()
    if @tasks.empty?
      puts "Task not found"
    else
      puts "ID  Description Status"
      puts "-----------------------"
      @tasks.each do |task|
        status = task.completed ? "[completed]" : "[incomplete] "
        puts "#{task.id}  #{task.description}  #{status}"
      end
    end
  end
    
  def mark_task_complete()
    list_tasks()
    print "Enter id:"
    task_id = gets.chomp.to_i
    if task_id.positive?
      task = find_task(task_id)
      if task
        task.completed = true
        puts "completed"
      else
        puts "Task not found."
      end
    else 
      puts " Please enter a positive integer." 
    end
  end
    
  def delete_task()
    list_tasks()
    print "Enter id : "
    task_id = gets.chomp.to_i
    if task_id.positive?
      task = find_task(task_id)
      if task
        @tasks.delete(task)
         puts "Task deleted succesfully!"
      else
        puts " Task not found"
      end
    else 
      puts " Please enter a positive integer." 
    end
  end

  def update_task ()
    list_tasks()
    print "Enter id : "
    task_id = gets.chomp.to_i
    if task_id.positive?
      task = find_task(task_id)
      if task
        print "enter new description:"
        new_discription = gets.chomp
        task.description = new_discription
        puts " Task updated succesfully!"
      else
        puts " Task not found"
      end
    else 
      puts " Please enter a positive integer." 
    end
  end 

  def search_task()
    keyword = nil

    3.times do |attempts|
    print "Enter the keyword of the task to search: "
    keyword = gets.chomp
    break unless  keyword.empty?
      puts "Please enter a keyword to search! "
    end 

    if  keyword.empty?
      puts "failed to search! "
      return 
    end 

    matching = @tasks.select { |task| task.description.downcase.include?(keyword.downcase) }

    if matching.empty?
      puts "No matching tasks found."
    else
      puts "ID  Description Status"
      puts "-----------------------"
      matching.each do |task|
        status = task.completed ? "[completed]" : "[incomplete] "
        puts " #{task.id}  #{task.description}  #{status}"
      end
    end
  end
      
   private

  def find_task(id)
    @tasks.find { |task| task.id == id }
  end

end

