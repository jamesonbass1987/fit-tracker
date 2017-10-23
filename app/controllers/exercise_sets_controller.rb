class ExerciseSetsController < ApplicationController

  get '/exercises/:exercise_id/sets' do
    logged_in_redirect_check

    #set variables for user, exercise and sets
    @user = current_user
    @exercise = Exercise.find_by_id(params[:exercise_id])
    @sets = @exercise.exercise_sets
    @set_num = 0

    #parse url to retrieve workout id to redirect user to after editing set
    workout_id_parser

    #validate exercise exists and belongs to user
    exercise_validation

    erb :'/exercise_sets/show'
  end


  get '/exercises/:exercise_id/sets/new' do
    logged_in_redirect_check

    #set variables for user, exercise and sets
    @user = current_user
    @exercise = Exercise.find_by_id(params[:exercise_id])
    @sets = @exercise.exercise_sets
    @set_num = 0

    #parse url to retrieve workout id to redirect user to after editing set
    workout_id_parser

    #validate exercise exists and belongs to user
    exercise_validation

    erb :'/exercise_sets/create'
  end

  post '/exercises/:exercise_id/sets' do

    #set a set variable based on input params and save to DB
    @set = ExerciseSet.create(:weight => params[:weight], :units => params[:units], :reps => params[:reps])

    #parse url to retrieve workout id to redirect user to after editing set
    workout_id_parser

    #set variables for user & exercise
    @user = current_user
    @exercise = Exercise.find_by_id(params[:exercise_id])

    #assign set to exercise
    @exercise.exercise_sets << @set

    redirect to "/exercises/#{@exercise.id}/sets/edit?workout_id=#{@workout_id}"

  end

  get '/exercises/:exercise_id/sets/edit' do
    logged_in_redirect_check

    #set variables for user, exercise and sets
    @user = current_user
    @exercise = Exercise.find_by_id(params[:exercise_id])
    @sets = @exercise.exercise_sets
    @set_num = 0

    #parse url to retrieve workout id to redirect user to after editing set
    workout_id_parser

    #validate exercise exists and belongs to user
    exercise_validation

    #check to see if sets are available to edit, otherwise redirect to new set creation
    if @sets.empty?
      redirect to "/exercises/#{@exercise.id}/sets/new?workout_id=#{@workout_id}"
    end
    erb :'/exercise_sets/edit'
  end

  patch '/exercises/:exercise_id/sets' do

    #set variables for user, exercise, and sets
    @user = current_user
    @exercise = Exercise.find_by_id(params[:exercise_id])
    @sets = @exercise.exercise_sets

    #parse url to retrieve workout id to redirect user to after editing set
    workout_id_parser

    #update sets based on new weight and rep params
    set_num = 1
    @sets.each do |set|
      set.update(weight: params[:exercise_set][:"#{set_num}"][:weight], reps: params[:exercise_set][:"#{set_num}"][:reps])
      set_num += 1
    end

    if @workout_id != 'null'
      redirect to "/workouts/#{@workout_id}"
    else
      redirect to "/exercises/#{@exercise.id}"
    end
  end

  delete '/exercises/:exercise_id/sets/delete' do

    #set variables for user, exercise, and sets, and set to delete
    user = current_user
    exercise = Exercise.find_by_id(params[:exercise_id])
    sets = exercise.exercise_sets

    #parse url to retrieve workout id to redirect user to after editing set
    workout_id_parser

    #find array value of set to delete
    delete_set = sets[params[:set_num].to_i - 1]

    #validate current user is creator of exercise
    delete_set.destroy

    redirect to "/exercises/#{exercise.id}/sets/edit?workout_id=#{@workout_id}"
  end


end
