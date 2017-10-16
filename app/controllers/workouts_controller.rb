class WorkoutsController < ApplicationController

  get '/workouts' do
    logged_in_redirect_check
    redirect to :"/users/#{current_user.username}"
  end

  get '/workouts/new' do
    logged_in_redirect_check

    #set instance variables based on exercise body part
    @legs = Exercise.all.find_all { |exercise| exercise.body_part == "Legs" && (exercise.user_id.nil? || exercise.user_id == current_user.id)}
    @chest = Exercise.all.find_all { |exercise| exercise.body_part == "Chest" && (exercise.user_id.nil? || exercise.user_id == current_user.id)}
    @shoulders = Exercise.all.find_all { |exercise| exercise.body_part == "Shoulders" && (exercise.user_id.nil? || exercise.user_id == current_user.id)}
    @arms = Exercise.all.find_all { |exercise| exercise.body_part == "Arms" && (exercise.user_id.nil? || exercise.user_id == current_user.id)}
    @back = Exercise.all.find_all { |exercise| exercise.body_part == "Back" && (exercise.user_id.nil? || exercise.user_id == current_user.id)}
    @abdominals = Exercise.all.find_all { |exercise| exercise.body_part == "Abdominals" && (exercise.user_id.nil? || exercise.user_id == current_user.id)}

    erb :"/workouts/create"
  end

  post '/workouts' do
    user = current_user

    #check for blank name entry or blank exercise entries
    if params[:name] == ""
      redirect to '/workouts/new'
    end

    #create new workout instance and save to DB
    workout = Workout.create(:name => params[:name], :description => params[:description])

    #enumerate through selected exercises, if any, adding them to workout
    if params.include?(:exercise)
      params[:exercise][:id].each do |exercise_id|
        exercise = Exercise.find_by_id(exercise_id)
        workout.exercises << exercise
      end
    end

    #save to user workouts
    user.workouts << workout

    redirect to :"/workouts/#{workout.id}"
  end

  get '/workouts/:id' do
    logged_in_redirect_check
    @workout = Workout.find_by_id(params[:id])

    #check to see if workout exists and belong to current user
    if @workout && @workout.user_id == current_user.id
      erb :"/workouts/show"
    else
      redirect to :"/workouts"
    end


  end

  get '/workouts/:id/edit' do
    logged_in_redirect_check
    @workout = Workout.find_by_id(params[:id])

    if !@workout.nil? && @workout && current_user.id == @workout.user_id

      #set instance variables based on exercise body part
      @legs = Exercise.all.find_all { |exercise| exercise.body_part == "Legs" && (exercise.user_id.nil? || exercise.user_id == current_user.id)}
      @chest = Exercise.all.find_all { |exercise| exercise.body_part == "Chest" && (exercise.user_id.nil? || exercise.user_id == current_user.id)}
      @shoulders = Exercise.all.find_all { |exercise| exercise.body_part == "Shoulders" && (exercise.user_id.nil? || exercise.user_id == current_user.id)}
      @arms = Exercise.all.find_all { |exercise| exercise.body_part == "Arms" && (exercise.user_id.nil? || exercise.user_id == current_user.id)}
      @back = Exercise.all.find_all { |exercise| exercise.body_part == "Back" && (exercise.user_id.nil? || exercise.user_id == current_user.id)}
      @abdominals = Exercise.all.find_all { |exercise| exercise.body_part == "Abdominals" && (exercise.user_id.nil? || exercise.user_id == current_user.id)}

      erb :"/workouts/edit"
    else
      redirect to :"/workouts"
    end
  end

  patch '/workouts/:id' do

    #find workout and current user and set to instance variables
    workout = Workout.find_by_id(params[:id])

    #update name and description sections with any changes
    workout.name = params[:name]
    workout.description = params[:workout_description]

    #iterate through newly added exercises, adding them to workout
    if params[:exercise].include?(:id)
      params[:exercise][:id].each do |id|
        exercise = Exercise.find_by_id(id)
        workout.exercises << exercise
      end
    end

    #iterate through current exercise attributes, removing from workout
    if params[:exercise].include?(:current_exercises)
      params[:exercise][:current_exercises].each do |id|
        exercise = Exercise.find_by_id(id)
        workout.exercises.delete(exercise)
      end
    end

    workout.save

    redirect to :"/workouts/#{workout.id}"
  end

  delete '/workouts/:id/delete' do
    workout = Workout.find_by_id(params[:id])

    #validate current user is owner of workout and logged in
    if current_user.id == workout.user_id && logged_in?
      workout.destroy
    end

    redirect to "/workouts"

  end

end
