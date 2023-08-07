
module CsvExport

  def export_csv(tasks)
    require 'csv'
    
    CSV.open('tasks.csv', 'w') do |csv|
      csv << ['ID', 'Description', 'Completed']
      tasks.each do |task|
        csv << [task.id, task.description, task.completed]
      end
    end
    puts "Tasks exported successfully!"
  end
end