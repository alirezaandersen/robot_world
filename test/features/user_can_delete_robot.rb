require_relative '../test_helper'


class UserSeesAllRobotsTest < FeatureTest
  include TestHelpers
  include Capybara::DSL


  def test_user_can_delete_a_robot
    create_robots(10)
    robot_count = robot_manager.all.length

    robo = robot_manager.all.last
    visit '/robots/%d' % [robo.id]

    binding.pry
    find('#%d' % [robo.id]).click
    assert_equal robot_manager.all.length, robot_count-1


    assert_equal '/robots/%d' % [robo.id], current_path
    within 'h1' do
      assert page.has_content? 'Ali'
    end
    within 'p' do
      assert page.has_content? 'Denver'
    end
  end


end
