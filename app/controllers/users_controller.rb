class UsersController < ApplicationController

  get '/users/:username' do
    logged_in_redirect_check

    if current_user == User.find_by(:username => params[:username])
      erb :"/users/show"
    else
      redirect to :"/users/#{current_user.username}"
    end
  end

end
