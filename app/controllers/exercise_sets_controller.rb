class ExerciseSetsController < ApplicationController

  get '/exercises/:exercise_id/sets' do
    logged_in_redirect_check

    #set variables for user, exercise and sets
    @user = current_user
    @exercise = Exercise.find_by_id(params[:exercise_id])
    @sets = ExerciseSet.all.find_all{|set| set.user_id == @user.id && set.exercise_id == @exercise.id}
    @set_num = 0
    #check if exercise is not part of the stock group or if it doesn't belong to current_user, if so, redirects to profile page
    exercise_set_owner_check

    #check if exercise belongs to a workout already, if not, redirect to profile page
    exercise_set_workout_check

    erb :'/exercise_sets/show'
  end


  get '/exercises/:exercise_id/sets/new' do
    logged_in_redirect_check

    #set variables for user, exercise and sets
    @user = current_user
    @exercise = Exercise.find_by_id(params[:exercise_id])
    @sets = ExerciseSet.all.find_all{|set| set.user_id == @user.id && set.exercise_id == @exercise.id}
    @units = @exercise.exercise_sets.where("user_id = '#{current_user.id}'")
    @set_num = 0
    #check if exercise is not part of the stock group or if it doesn't belong to current_user, if so, redirects to profile page
    exercise_set_owner_check

    #check if exercise belongs to a workout already, if not, redirect to profile page
    exercise_set_workout_check


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

    redirect to "/exercises/#{@exercise.id}/sets"

  end

  get '/exercises/:exercise_id/sets/edit' do
    logged_in_redirect_check

    #set variables for user, exercise and sets
    @user = current_user
    @exercise = Exercise.find_by_id(params[:exercise_id])
    @sets = ExerciseSet.all.find_all{|set| set.user_id == @user.id && set.exercise_id == @exercise.id}
    @set_num = 0
    @units = @exercise.exercise_sets.where("user_id = '#{current_user.id}'")

    #check if exercise is not part of the stock group or if it doesn't belong to current_user, if so, redirects to profile page
    exercise_set_owner_check

    #check if exercise belongs to a workout already, if not, redirect to profile page
    exercise_set_workout_check

    #check to see if sets are available to edit, otherwise redirect to new set creation
    if @sets.empty?
      redirect to "/exercises/#{@exercise.id}/sets/new"
    end

    erb :'/exercise_sets/edit'
  end

  patch '/exercises/:exercise_id/sets' do

    #check for blank values
    if params[:weight] == "" || params[:reps] == ""
      redirect to '/exercises/:exercise_id/sets/new'
    end

    #set variables for user, exercise, and sets
    @user = current_user
    @exercise = Exercise.find_by_id(params[:exercise_id])
    @sets = ExerciseSet.all.find_all{|set| set.user_id == @user.id && set.exercise_id == @exercise.id}

    #update sets based on new weight and rep params
    set_num = 1
    @sets.each do |set|
      set.weight = params[:exercise_set][:"#{set_num}"][:weight]
      set.reps = params[:exercise_set][:"#{set_num}"][:reps]
      set.save
      set_num += 1
    end

    redirect to "/exercises/#{@exercise.id}/sets"
  end

  delete '/exercises/:exercise_id/sets/delete' do

    #set variables for user, exercise, and sets, and set to delete
    user = current_user
    exercise = Exercise.find_by_id(params[:exercise_id])
    sets = ExerciseSet.all.find_all{|set| set.user_id == user.id && set.exercise_id == exercise.id}
    set_val = params[:exercise_set].key("Delete")

    #find array value of set to delete
    delete_set = sets[set_val.to_i - 1]

    #validate current user is creator of exercise
    if current_user.id == exercise.user_id
      delete_set.destroy
    end

    redirect to "/exercises/#{exercise.id}/sets"
  end


end
