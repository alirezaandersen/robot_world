require_relative '../test_helper'

class RobotWorldAppTest < Minitest::Test
  include TestHelpers

  # def setup
  #   robot_manager.create({
  #     :name        =>"Maci Raynor DDS",
  #     :city        =>"New Pattie",
  #     :state       =>"Texas",
  #     :avatar      =>"https://robohash.org/sedquovoluptatibus.png?size=300x300&set=set1",
  #     :birthdate   =>"2005-10-30",
  #     :date_hired  =>"1975-01-24",
  #     :department  =>"Books"})

    # robot_manager.create({
    #    "name"       =>"Alayna Collier",
    #    "city"       =>"West Sydneeville",
    #    "state"      =>"North Dakota",
    #    "avatar"     =>"https://robohash.org/utquasprovident.png?size=300x300&set=set1",
    #    "birthdate"  =>"1931-01-23",
    #    "date_hired" =>"2009-06-18",
    #    "department" =>"Music, Clothing & Movies"})
    #
    #  robot_manager.create({
    #    "name"        =>"Berta Beatty",
    #    "city"        =>"Maximillianville",
    #    "state"       =>"Iowa",
    #    "avatar"      =>"https://robohash.org/fugiteumqui.png?size=300x300&set=set1",
    #    "birthdate"   =>"1922-06-05",
    #    "date_hired"  =>"1962-09-18",
    #    "department"  =>"Music"})
  # end

  # def test_it_can_find_all
  #
  #   robo = robot_manager.all
  #   assert_equal 3, robo.size
  # end

  # def test_it_can_find_a_specific_robot_by_id
  #
  #   robo = robot_manager.find(2)
  #   assert_equal "Alayna Collier", robo.name
  #   assert_equal "West Sydneeville", robo.city
  #   assert_equal 2, robo.id
  #   assert_equal "1931-01-23", robo.birthdate
  # end
  #
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
  #
  # def test_it_can_update_an_existing_robot
  #   robo = robot_manager.find(2)
  #   assert_equal "Alayna Collier", robo.name
  #   assert_equal "West Sydneeville", robo.city
  #   assert_equal 2, robo.id
  #   assert_equal "1931-01-23", robo.birthdate
  #
  #   updated_robot =
  #   {"name"       =>"Alayna Collier",
  #    "city"       =>"Chatsworth",
  #    "state"      =>"California",
  #    "avatar"     =>"https://robohash.org/utquasprovident.png?size=300x300&set=set1",
  #    "birthdate"  =>"1931-01-23",
  #    "date_hired" =>"2009-06-18",
  #    "department" =>"Music, Clothing & Movies"}
  #
  #   robot_manager.update(2, updated_robot)
  #   robo = robot_manager.find(2)
  #   assert_equal "Chatsworth", robo.city
  #   assert_equal "California", robo.state
  #   assert_equal 2, robo.id
  # end
  #
  # def test_it_will_destroy_an_exisiting_robot
  #   robo = robot_manager.destroy(3)
  #   assert_equal 2, robo.size
  # end

end
