require_relative '../test_helper'

class RobotTest < Minitest::Test
  include TestHelpers

  def test_assigns_attributes_correctly
    robo = Robot.new({
          :name        =>"Maci Raynor DDS",
          :city        =>"New Pattie",
          :state       =>"Texas",
          :avatar      =>"https://robohash.org/sedquovoluptatibus.png?size=300x300&set=set1",
          :birthdate   =>"2005-10-30",
          :date_hired  =>"1975-01-24",
          :department  =>"Books"})

    assert_equal "Maci Raynor DDS", robo.name
    assert_equal "New Pattie", robo.city
    assert_equal "Texas", robo.state
  end
end
