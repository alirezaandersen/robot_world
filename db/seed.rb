require 'faker'
require '../app/models/robot_world'

class Fixnum
  SECONDS_IN_DAY = 24 * 60 * 60

  def days
    self * SECONDS_IN_DAY
  end

  def ago
    Time.now - self
  end
end

database = YAML::Store.new('robot_manager')
model = RobotWorld.new(database)
params = {}

10.times do |n|
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
