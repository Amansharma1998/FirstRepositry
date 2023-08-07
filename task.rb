class Task

  attr_accessor :id, :description, :completed
  
  def initialize(id, description, completed = false)
    @id = id
    @description = description
    @completed = completed
  end
end