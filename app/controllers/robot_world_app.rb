require 'sinatra'

class RobotWorldApp < Sinatra::Base
  #set :root, File.expand_path("..", __dir__)


  get '/' do
    "inside get /"
  end

# All
  get '/robots' do
    #Display all robots
  end

# View single robot by id
  get '/robots/:id' do

  end

#Edit/Update single robot by id
  get '/robots/:id/edit' do
    "this is my id edit"
  end

  put '/robots/:id' do

  end

  #Create a new robot

  post '/robots' do

  end

  #Deletes a robot by id

  delete '/robots/:id' do

  end


end
