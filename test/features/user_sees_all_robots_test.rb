require_relative '../test_helper'


class UserSeesAllRobotsTest < FeatureTest
  include TestHelpers
  include Capybara::DSL


  def test_user_sees_all_robots
    visit('/')
    click_link('Meet the Robots')
    assert_equal '/robots', current_path
  end

  def test_user_can_access_create_new_robot
    visit('/robots')
    click_link('Create New Robot')
    assert_equal '/robots/new', current_path
  end

  def test_user_can_access_robot_statistics
    visit('/robots')
    click_link('Robot Statistic')
    assert_equal '/robots/stats', current_path
  end 

end
