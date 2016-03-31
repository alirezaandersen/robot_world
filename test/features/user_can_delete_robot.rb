require_relative '../test_helper'


class UserSeesAllRobotsTest < FeatureTest
  include TestHelpers
  include Capybara::DSL
  include Rack::Test::Methods

  def app
    RobotWorldApp
  end

  def test_user_can_delete_a_robot
    create_robots(10)
    robot_count = robot_manager.all.length

    robo = robot_manager.all.last

    visit '/robots/%d' % [robo.id]
    assert_equal '/robots/%d' % [robo.id], current_path
    binding.pry
    authorize 'admin', 'admin'
    find('#%d' % [robo.id]).click

    assert_equal '/robots/%d' % [robo.id], current_path
    save_and_open_page

    assert_equal robot_manager.all.length, robot_count -1
  end

  def test_user_cannot_delete_robot_without_protected_authorization
    create_robots(10)
    robot_count = robot_manager.all.length

    robo = robot_manager.all.last

    visit '/robots/%d' % [robo.id]
    assert_equal '/robots/%d' % [robo.id], current_path

    assert_equal robot_manager.all.length, robot_count

    authorize 'admin', 'admin'
    find('#%d' % [robo.id]).click
    assert_equal '/robots/%d' % [robo.id], current_path

    assert_equal robot_count -1, robot_manager.all.length
  end

end
