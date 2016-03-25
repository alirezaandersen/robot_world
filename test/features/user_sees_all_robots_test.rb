require_relative '../test_helper'


class UserSeesAllRobotsTest < FeatureTest
  include TestHelpers
  include Capybara::DSL


  def test_user_sees_all_robots

    visit("/robots")
    click_link('Create new')
    assert_equal '/robots/new', current_path


  end

end
