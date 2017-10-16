class UsersController < ApplicationController

  get '/users/:username' do
    logged_in_redirect_check
    @user = current_user

    if @user == User.find_by(:username => params[:username])
      @authorized_user = true
    end

    erb :"/users/show"
  end

end
