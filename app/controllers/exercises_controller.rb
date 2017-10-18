class ExercisesController < ApplicationController

  get '/exercises' do
    logged_in_redirect_check

    #set instance variables based on exercise body part
    @legs = Exercise.all.find_all { |exercise| exercise.body_part == "Legs" && (exercise.user_id.nil? || exercise.user_id == current_user.id)}
    @chest = Exercise.all.find_all { |exercise| exercise.body_part == "Chest" && (exercise.user_id.nil? || exercise.user_id == current_user.id)}
    @shoulders = Exercise.all.find_all { |exercise| exercise.body_part == "Shoulders" && (exercise.user_id.nil? || exercise.user_id == current_user.id)}
    @arms = Exercise.all.find_all { |exercise| exercise.body_part == "Arms" && (exercise.user_id.nil? || exercise.user_id == current_user.id)}
    @back = Exercise.all.find_all { |exercise| exercise.body_part == "Back" && (exercise.user_id.nil? || exercise.user_id == current_user.id)}
    @abdominals = Exercise.all.find_all { |exercise| exercise.body_part == "Abdominals" && (exercise.user_id.nil? || exercise.user_id == current_user.id)}

    erb :"/exercises/index"
  end

  get '/exercises/new' do
    logged_in_redirect_check

    erb :"/exercises/create"
  end

  post '/exercises' do
    #create instance variable from submitted information
    @exercise = Exercise.new(:name => params[:name], :description => params[:description], :body_part => params[:body_part], :weight_type => params[:weight_type])
    @user = current_user

    #search current list of exercises for duplicates in open exercise list or user created list and check for blank parameters, if so, reload page with error
    if Exercise.all.any?{|exercise| (exercise.name == @exercise.name && exercise.user_id == current_user.id) || (exercise.name == @exercise.name && exercise.user_id.nil?)} || @exercise.name == "" || @exercise.description == ""
      @exercise_creation_error = true
      erb :"/exercises/create"
    else
      #associate created exercise to user
      @user.exercises << @exercise

      #save exercise instance to DB
      @exercise.save

      erb :"/exercises/show"
    end
  end

  get '/exercises/:id' do
    logged_in_redirect_check

    @exercise = Exercise.find_by_id(params[:id])

    if @exercise && (@exercise.user_id == current_user.id || @exercise.user_id.nil?)
      erb :"/exercises/show"
    else
      redirect to :"/exercises"
    end
  end

  get '/exercises/:id/edit' do
    logged_in_redirect_check

    @exercise = Exercise.find_by_id(params[:id])

    #check to see if exerise exists and current user created this exercise and is allowed to edit
    if !@exercise || @exercise.user_id != current_user.id
      redirect to :"/exercises"
    else
      erb :"/exercises/edit"
    end
  end

  patch '/exercises/:id' do

    #create instance of exercise
    @exercise = Exercise.find_by_id(params[:id])

    #checks for blank fields, redirects with error if so
    if params[:name] == "" || params[:description] == ""
      @exercise_edit_error = true
      erb :"/exercises/edit"
    end


    if @exercise.name != params[:name] || @exercise.description != params[:description] || @exercise.body_part != params[:body_part] || @exercise.weight_type != params[:weight_type]
      erb :"/exercises/create"
      #update parameters if any have changed
      @exercise.name = params[:name]
      @exercise.description = params[:description]
      @exercise.body_part = params[:body_part]
      @exercise.weight_type = params[:weight_type]
    end

    #check to see if any exercises currently exist with the same name belonging to the current user or for exercises in open exercise list
    if Exercise.all.any?{|exercise| (exercise.name == @exercise.name && exercise.user_id == current_user.id) || (exercise.name == @exercise.name && exercise.user_id.nil?) }
      @exercise_edit_error = true
      erb :"/exercises/edit"
    end

    #save to db
    @exercise.save

    redirect to :"/exercises/#{@exercise.id}"

  end

  delete '/exercises/:id/delete' do
    
    exercise = Exercise.find_by_id(params[:id])

    #validate current user is creator of exercise
    if current_user.id == exercise.user_id
      exercise.destroy
    end

    redirect to "/exercises"
  end

end
