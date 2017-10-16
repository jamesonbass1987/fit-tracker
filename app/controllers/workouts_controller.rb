class WorkoutsController < ApplicationController

  get '/workouts' do
    logged_in_redirect_check
    redirect to :"/users/#{current_user.username}"
  end

  get '/workouts/new' do
    logged_in_redirect_check

    #set instance variables based on exercise body part
    @legs = Exercise.all.find_all { |exercise| exercise.body_part == "Legs"}
    @chest = Exercise.all.find_all { |exercise| exercise.body_part == "Chest"}
    @shoulders = Exercise.all.find_all { |exercise| exercise.body_part == "Shoulders"}
    @arms = Exercise.all.find_all { |exercise| exercise.body_part == "Arms"}
    @back = Exercise.all.find_all { |exercise| exercise.body_part == "Back"}
    @abdominals = Exercise.all.find_all { |exercise| exercise.body_part == "Abdominals"}

    erb :"/workouts/create"
  end

  post '/workouts' do
    @user = current_user

    #check for blank name entry
    if params[:name] == ""
      redirect to '/workouts/new'
    end

    #create new workout instance and save to DB
    @workout = Workout.create(:name => params[:name], :notes => params[:notes])

    #enumerate through selected exercises, adding them to workout
    params[:exercise][:id].each do |exercise_id|
      exercise = Exercise.find_by_id(exercise_id)
      @workout.exercises << exercise
    end

    #save to user workouts
    @user.workouts << @workout

    redirect to :"/workouts/#{@workout.id}"
  end

  get '/workouts/:id' do
    logged_in_redirect_check
    @workout = Workout.find_by_id(params[:id])

    if @workout && @workout.user_id == current_user.id
      @authorized_user = true
    end

    erb :"/workouts/show"
  end

  get '/workouts/:id/edit' do
    logged_in_redirect_check
    @workout = Workout.find_by_id(params[:id])

    if @workout && current_user.id == @workout.user_id

      #set instance variables based on exercise body part
      @legs = Exercise.all.find_all { |exercise| exercise.body_part == "Legs"}
      @chest = Exercise.all.find_all { |exercise| exercise.body_part == "Chest"}
      @shoulders = Exercise.all.find_all { |exercise| exercise.body_part == "Shoulders"}
      @arms = Exercise.all.find_all { |exercise| exercise.body_part == "Arms"}
      @back = Exercise.all.find_all { |exercise| exercise.body_part == "Back"}
      @abdominals = Exercise.all.find_all { |exercise| exercise.body_part == "Abdominals"}

      erb :"/workouts/edit"
    else
      redirect to :"/workouts"
    end
  end

  patch '/workouts/:id' do

    #find workout and current user and set to instance variables
    @workout = Workout.find_by_id(params[:id])

    #update name and notes sections with any changes
    @workout.name = params[:name]
    @workout.notes = params[:workout_notes]

    #iterate through newly added exercises, adding them to workout
    if params[:exercise][:id]
      params[:exercise][:id].each do |id|
        exercise = Exercise.find_by_id(id)
        @workout.exercises << exercise
      end
    end

    #iterate through current exercise attributes, updating params if needed
    params[:exercise][:current_exercises].each do |exercise|
      name = exercise[0].split("_").map {|word| word.capitalize}.join(" ")
      current_exercise = @workout.exercises.find_by_name(name)
      current_exercise.notes = exercise[1][:notes]
      current_exercise.weight_type = exercise[1][:weight_type]
      current_exercise.save
    end

    @workout.save

    redirect to :"/workouts/#{@workout.id}"
  end

  delete '/workouts/:id/delete' do
    workout = Workout.find_by_id(params[:id])

    if current_user.id == workout.user_id && logged_in?
      workout.destroy
      redirect to "/workouts"
    else
      redirect to "/workouts"
    end

  end

end
