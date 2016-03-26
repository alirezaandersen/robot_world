require_relative '../test_helper'

class RobotWorldAppTest < Minitest::Test
  include TestHelpers
  include StatisticHelper

  def setup
    robot_manager.create({
     :name       =>"ROBOT 2",
     :city       =>"Riverside",
     :state      =>"California",
     :birthdate  =>"1923-02-14",
     :avatar     =>"https://robohash.org/quasiquiqui.png?size=300x300&set=set1",
     :date_hired =>"1943-03-24",
     :department =>"Sports & Health"})

    robot_manager.create({
     :name       =>"ROBOT 2",
     :city       =>"Chatsworth",
     :state      =>"California",
     :birthdate  =>"1913-02-14",
     :avatar     =>"https://robohash.org/quasiquiqui.png?size=300x300&set=set1",
     :date_hired =>"1942-03-24",
     :department =>"Sports & Hunting"})

    robot_manager.create({
     :name       =>"ROBOT 2",
     :city       =>"Chatsworth",
     :state      =>"California",
     :birthdate  =>"1923-02-14",
     :avatar     =>"https://robohash.org/quasiquiqui.png?size=300x300&set=set1",
     :date_hired =>"1943-03-24",
     :department =>"Sports & Health"})
  end

  def test_it_can_find_a_specific_robot_by_id
    create_robots(5)
    robo = robot_manager.all.last
    assert_equal "ROBOT 5", robo.name
    assert_equal "Robot city 6", robo.city
  end

  def test_it_can_create_a_new_robot
    robot_manager.create({
       :name        =>"Johnny Beatty",
       :city        =>"Maximillianville",
       :state       =>"Iowa",
       :avatar      =>"https://robohash.org/fugiteumqui.png?size=300x300&set=set1",
       :birthdate   =>"1922-06-05",
       :date_hired  =>"1962-09-18",
       :department  =>"Music"
       })

       robot = robot_manager.all.last

    assert_equal "Johnny Beatty", robot.name
  end

  def test_it_can_update_an_existing_robot

    create_robots(2)
    robo = robot_manager.all.last
    assert_equal "ROBOT 2", robo.name
    assert_equal "Robot city 3", robo.city
    assert_equal Date.new.class, Date.strptime(robo.birthdate,"%Y-%m-%d").class

    updated_robo_data =
    {
     :name       =>"ROBOT 2",
     :city       =>"Chatsworth",
     :state      =>"California",
     :birthdate  =>"1923-02-14",
     :avatar     =>"https://robohash.org/quasiquiqui.png?size=300x300&set=set1",
     :date_hired =>"1943-03-24",
     :department =>"Sports & Health"}

    robot_manager.update(robo.id, updated_robo_data)
    updated_robo = robot_manager.find(robo.id)
    assert_equal "Chatsworth", updated_robo.city
    assert_equal "California", updated_robo.state
  end

  def test_it_will_destroy_an_exisiting_robot
    create_robots(10)

    total_robots = robot_manager.all.length
    assert_equal 13, total_robots

    robo = robot_manager.all.last
    robot_manager.destroy(robo.id)

    assert_equal total_robots -1, robot_manager.all.length
  end

  def test_vaild_birthdate_age
    robot_manager.create({
     :name       =>"ROBOT 2",
     :city       =>"Chatsworth",
     :state      =>"California",
     :birthdate  =>"1923-02-14",
     :avatar     =>"https://robohash.org/quasiquiqui.png?size=300x300&set=set1",
     :date_hired =>"1943-03-24",
     :department =>"Sports & Health"})
    # binding.pry
    assert_equal 93, robot_manager.get_all_robot_ages.last
  end

  def test_average_robot_age
    robo = robot_manager.all
    assert_equal 96, robot_manager.get_average_robot_age
  end

  def test_robots_hired_per_year
    robo = robot_manager.all
    assert_equal  "1943", robot_manager.robots_hired_per_year.keys.first
    assert_equal 2, robot_manager.robots_hired_per_year.values.first
  end

  def test_number_employees_per_department
    robot = robot_manager.all
    assert_equal "sports", robot_manager.employees_per_deparment.keys.first
    assert_equal 3, robot_manager.employees_per_deparment.values.first
  end

  def test_number_of_robots_per_city
    robot = robot_manager.all
    assert_equal "Chatsworth", robot_manager.population_by_city.keys.last
    assert_equal 2, robot_manager.population_by_city.values.last
  end

  def test_number_of_robots_per_state
    robot = robot_manager.all
    assert_equal "California", robot_manager.population_by_state.keys.last
    assert_equal 3, robot_manager.population_by_state.values.last
  end 

end
