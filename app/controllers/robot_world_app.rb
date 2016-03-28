class RobotWorldApp < Sinatra::Base

  get '/' do
    @robots = robot_manager.all
    erb :index
  end

  # All
  get '/robots' do
    @robots = robot_manager.all
    erb :all
  end

  #Create a new robot
  get '/robots/new' do
    @robot = Robot.new({})
    erb :new
  end

  post '/robots' do
    robot_id = robot_manager.create(params[:robot])
    redirect '/robots/%d' % [robot_id]
  end

  #Robot Stats
  get '/robots/stats' do
    @robot_stats = robot_manager.stats
    erb :dashboard
  end

  #Single Robot Profile
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
    robot_manager.update(id.to_i, params[:robot])
    redirect "/robots/#{id}"
  end

  #NotFound Error
  not_found do
    erb :error
  end

  #Deletes a robot by id
  delete '/robots/:id' do |id|
    protected!
    robot_manager.destroy(id.to_i)
    redirect '/robots'
  end

  def robot_manager
     if ENV["RACK_ENV"] == "test"
       database = Sequel.sqlite(APP_ROOT+'/db/robot_manager_test.sqlite')
     else
       database = Sequel.sqlite(APP_ROOT+'/db/robot_manager_development.sqlite')
    end
    @robot_manager ||= RobotWorld.new(database)
  end

end
