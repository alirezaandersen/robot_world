require_relative '../test_helper'


class UserSeesAllRobotsTest < FeatureTest
  include TestHelpers
  include Capybara::DSL


  def test_user_can_create_a_robot
    robot_count = robot_manager.all.length
    visit '/robots/new'
    fill_in 'robot[name]', with: 'Ali'
    fill_in 'robot[city]', with: 'Denver'
    fill_in 'robot[state]', with: 'Colorado'
    fill_in 'robot[birthdate]', with: '1980-01-06'
    fill_in 'robot[date_hired]', with: '2015-12-03'
    fill_in 'robot[department]', with: 'Student @turing'
    fill_in 'robot[avatar]', with: 'https://cbsmancave.files.wordpress.com/2013/04/subwooferbot-thinkstock.jpg?w=642'

    find('#submit').click
    assert_equal robot_manager.all.length, robot_count+1

    robo = robot_manager.all.last

    assert_equal '/robots/%d' % [robo.id], current_path
    within 'h1' do
      assert page.has_content? 'Ali'
    end
    within 'p' do
      assert page.has_content? 'Denver'
    end
  end


end
