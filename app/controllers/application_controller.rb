require './config/environment'

class ApplicationController < Sinatra::Base
  include LoginHelpers

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "fit_tracker_security"
  end

  get "/" do
    erb :index
  end

end
