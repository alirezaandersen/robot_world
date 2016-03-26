require_relative '../test_helper'


class UserSeesAllRobotsTest < FeatureTest
  include TestHelpers
  include Capybara::DSL

  def setup

  end

  def test_existing_robot_is_updated_with_new_information
    robot_id = robot_manager.create({
     :name       =>"ROBOT 2",
     :city       =>"Chatsworth",
     :state      =>"California",
     :birthdate  =>"1913-02-14",
     :avatar     =>"https://robohash.org/quasiquiqui.png?size=300x300&set=set1",
     :date_hired =>"1942-03-24",
     :department =>"Sports & Hunting"})

    visit '/robots/%d/edit' % [robot_id]
    fill_in 'robot[name]', with: 'ROBOT 3'
    fill_in 'robot[city]', with: 'Denver'
    #click_button('submit')
    find('#submit').click
    assert_equal '/robots/%d' % [robot_id], current_path
    # binding.pry
    within 'h1' do
      assert page.has_content? 'ROBOT 3'
    end
    within 'p' do
      assert page.has_content? 'Denver'
    end
  end



end
