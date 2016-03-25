
class RobotWorld
  include StatisticHelper
  attr_reader :database


  def initialize(database)
    @database = database
  end

  def create(robot)
    database.from(:robots).insert(robot)
  end

  def all
    database.from(:robots).map { |data| Robot.new(data)}
  end

  def find(id)
    raw_task = database.from(:robots).where(:id => id).to_a.first
    Robot.new(raw_task)
  end

  def update(id, robot)
    database.from(:robots).where(:id => id).update(robot)
  end

  def destroy(id)
    database.from(:robots).where(:id => id).delete
  end

  def delete_all
    database.from(:robots).delete
  end

  #statistics
  #figure out robots age
  def stats
    x = { average_robots_age: get_average_robot_age,
    number_of_robots_hired_per_year: robots_hired_per_year,
    number_of_robots_per_department: employees_per_deparment,
    number_of_robots_per_city: population_by_city,
    number_of_robots_per_state: population_by_state }
    # binding.pry
  end

end
