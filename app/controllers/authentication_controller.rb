class AuthenticationController < ApplicationController

  get '/signup' do
    #if logged in, redirect to user's page
    if !logged_in?
      erb :'/users/signup'
    else
      redirect to "/users/#{current_user.username}"
    end
  end

  post '/signup' do
    #check for any empty fields
    if nil_submission?
      @signup_error = true
      erb :'/signup'
    #check for any existing users that match that username or email
    elsif user_exists?
      @signup_duplication_error = true
      erb :'signup'
    #create user if all conditions are met
    else
      user = User.create(:username => params["username"], :first_name => params["first_name"], :last_name => params["last_name"], :email => params["email"], :password => params["password"])
      session[:id] = user.id
      redirect to "/users/#{user.username}"
    end
  end

  get '/login' do
    #set login error message if user attempts to visit a restricted page will not logged in
    @no_login_message = session[:no_login_error_message]

    if !logged_in?
      erb :'/users/login'
    else
      redirect to "/users/#{current_user.username}"
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    session[:login_error_message].clear unless session[:login_error_message].nil?

    if user && user.authenticate(params[:password])
      #set session id to user id
      session[:id] = user.id
      redirect to "/users/#{user.username}"
    else
      #set login error message, and reload login page
      @login_error = "There was a problem logging you in. Please check your credentials and try again."
      erb :'/users/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end
