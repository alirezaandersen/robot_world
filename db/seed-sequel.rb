require 'faker'
require 'sequel'
require '../app/helpers/stats'
require '../app/models/robot_world'
require '../app/helpers/fixnum_helper'

# class Fixnum
#   SECONDS_IN_DAY = 24 * 60 * 60
#
#   def days
#     self * SECONDS_IN_DAY
#   end
#
#   def ago
#     Time.now - self
#   end
# end

database = Sequel.sqlite('robot_manager_development.sqlite')
model = RobotWorld.new(database)
model.delete_all
params = {}

20.times do |n|
  params["id"] = n
  params["name"] = Faker::Name.name
  params["city"] = Faker::Address.city
  params["state"] = Faker::Address.state
  params["avatar"] = Faker::Avatar.image
  params["birthdate"] = Faker::Date.between((365*99).days.ago, Date.today)
  params["date_hired"] = Faker::Date.between((365*70).days.ago, Date.today)
  params["department"] = Faker::Commerce.department
  p params

  #RobotWorld.create(params)
  model.create(params)
  params.clear
end
