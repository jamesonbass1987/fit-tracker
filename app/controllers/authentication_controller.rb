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

    # #check for any existing users that match that username or email
    # if user_exists?
    #   @signup_duplication_error = true
    #   erb :"/users/signup"
    # #create user if all conditions are met
    # else
      user = User.new(:username => params["username"], :first_name => params["first_name"], :last_name => params["last_name"], :email => params["email"], :password => params["password"])
      if user.save
        session[:user_id] = user.id

        #Load all stock exercises into user account
        exercises = Exercise.where(user_id: nil)
        exercises.each { |exercise| user.exercises << exercise.dup }
        user.save

        redirect to "/users/#{user.username}"
      else
        @errors = user.errors.full_messages.join(', ')
        erb :"/users/signup"
      end
    #end
  end

  get '/login' do
    #set login error message if user attempts to visit a restricted page while not logged in

    if !logged_in?
      erb :'/users/login'
    else
      redirect to "/users/#{current_user.username}"
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      #set session id to user id
      session[:user_id] = user.id
      redirect to "/users/#{user.username}"
    else
      #set login error message, and reload login page
      @login_error = true
      erb :'/users/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end
