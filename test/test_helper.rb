require File.expand_path('../../app/config/environment', __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara/dsl'
require 'tilt/erb'
require 'faker'
require 'rack/test'



Capybara.app = RobotWorldApp #sets the app that will be tested with capybara

class FeatureTest < Minitest::Test
  include Capybara::DSL
end

ENV['RACK_ENV'] ||= 'test'
#if run shotgun defaults in developer mode, else when runs in test sets it equal to test environment

module TestHelpers

  def teardown
    robot_manager.delete_all
    super #minitest after every test will tear down doesn't overwrite functionality
  end

  def setup
    robot_manager.delete_all
    super
  end


  def reset_db
    system("rm",APP_ROOT+'/db/robot_manager_test.sqlite')
    system("ruby",APP_ROOT+'/db/migrate/001_creates_robots.rb')
    database = Sequel.sqlite(APP_ROOT+'/db/robot_manager_test.sqlite')
    @robot_manager = RobotWorld.new(database)
    create_robots(20)
  end

  def robot_manager #will overwrite what was database before. Manage data.
    database = Sequel.sqlite(APP_ROOT + '/db/robot_manager_test.sqlite')
    @robot_manager ||= RobotWorld.new(database)
  end

  def create_robots(num = 2)
    num.times do |i|
      robot_manager.create({name: "ROBOT #{i + 1}",
                            city: "Robot city #{i + 2}",
                            state: "Robot State #{i+ 3}",
                            avatar: Faker::Avatar.image,
                            birthdate: Faker::Date.between((365*99).days.ago, Date.today),
                            date_hired: Faker::Date.between((365*70).days.ago, Date.today),
                            department: Faker::Commerce.department})
    end
  end

end
