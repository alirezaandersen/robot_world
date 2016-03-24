require 'sinatra'
require 'models/robot_world'

class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  get '/' do
    "erb :dashboard"
  end

# All
  get '/robots' do
     @robots = robot_manager.all
     erb :all
  end


  #Create a new robot
  get '/robots/new' do
    erb :new
  end

  post '/robots' do
    robot_manager.create(params[:robot])
    redirect '/robots'
  end


  # View single robot by id
  get '/robots/:id' do |id|
    @robot = robot_manager.find(id.to_i)
    erb :show
  end

  #Edit/Update single robot by id
  get '/robots/:id/edit' do |id|
    @robot = robot_manager.find(id.to_i)
    erb :edit
  end

  put '/robots/:id' do |id|
    #binding.pry
    robot_manager.update(id.to_i, params[:robot])
    redirect "/robots/#{id}"
  end

  #Deletes a robot by id
  delete '/robots/:id' do |id|
    robot_manager.delete(id.to_i)
    redirect '/robots'
  end

  def robot_manager
    database = YAML::Store.new('db/robot_manager')
    @robot_manager ||= RobotWorld.new(database)
  end


end
