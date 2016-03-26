class RobotWorld
  include StatisticHelper

  attr_reader :database


  def initialize(database)
    @database = database
  end

  # #file manager => need to change all methods to use this.
  def dataset
    database.from(:robots)
  end

  def create(robot)
    dataset.insert(robot)
  end

  def all
    dataset.map { |data| Robot.new(data)}
  end

  def find(id)
    raw_task = dataset.where(:id => id).to_a.first
    Robot.new(raw_task)
  end

  def update(id, robot)
    dataset.where(:id => id).update(robot)
  end

  def destroy(id)
    dataset.where(:id => id).delete
  end

  def delete_all
    dataset.delete
  end

  #statistics
  def stats
    x = { average_robots_age: get_average_robot_age,
    number_of_robots_hired_per_year: robots_hired_per_year,
    number_of_robots_per_department: employees_per_deparment,
    number_of_robots_per_city: population_by_city,
    number_of_robots_per_state: population_by_state }
    # binding.pry
  end

end
