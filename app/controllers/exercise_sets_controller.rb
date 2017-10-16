class ExerciseSetsController < ApplicationController

  get '/exercises/:exercise_id/sets/edit' do
    logged_in_redirect_check

    #set variables for user, exercise and sets
    @user = current_user
    @exercise = Exercise.find_by_id(params[:exercise_id])
    @sets = ExerciseSet.all.find_all{|set| set.user_id == @user.id && set.exercise_id == @exercise.id}

    #check if exercise is not part of the stock group or if it doesn't belong to current_user, if so, redirects to profile page
    if (!@exercise.user_id.nil? && @exercise.user_id != @user.id)
      redirect to :"/users/<%= @user.username %>"
    end
    erb :'/exercise_sets/edit'
  end


  get '/exercises/:exercise_id/sets/new' do
    logged_in_redirect_check

    #set variables for user, exercise and sets
    @user = current_user
    @exercise = Exercise.find_by_id(params[:exercise_id])
    @sets = ExerciseSet.all.find_all{|set| set.user_id == @user.id && set.exercise_id == @exercise.id}

    #check if exercise is not part of the stock group or if it doesn't belong to current_user, if so, redirects to profile page
    if (!@exercise.user_id.nil? && @exercise.user_id != @user.id)
      redirect to :"/users/<%= @user.username %>"
    end

    erb :'/exercise_sets/create'
  end

  post '/exercises/:exercise_id/sets' do

    #check for blank values
    if params[:weight] == "" || params[:reps] == ""
      redirect to '/exercises/:exercise_id/sets/new'
    end

    #set a set variable based on input params and save to DB
    @set = ExerciseSet.new(:weight => params[:weight], :measurement => params[:measurement], :reps => params[:reps])
    @set.save

    #set variables for user & exercise
    @user = current_user
    @exercise = Exercise.find_by_id(params[:exercise_id])

    #assign set to user and exercise
    @user.exercise_sets << @set
    @exercise.exercise_sets << @set

    binding.pry

    redirect to "/exercises/#{@exercise.id}"

  end




end
