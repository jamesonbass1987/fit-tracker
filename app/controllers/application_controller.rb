require './config/environment'

class ApplicationController < Sinatra::Base
  include LoginHelpers
  include ExerciseHelpers
  include WorkoutHelpers

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "fit_tracker_security"
  end

  get "/" do
    if logged_in?
      redirect to :"/users/#{current_user.username}"
    else
      erb :index
    end
  end

end
