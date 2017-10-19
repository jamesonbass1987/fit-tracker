class WorkoutsController < ApplicationController

  get '/workouts' do
    logged_in_redirect_check
    @user = current_user

    erb :"/workouts/index"
  end

  get '/workouts/new' do
    logged_in_redirect_check

    #set instance variables for user exercises, ordering by body_part for display on view page
    @exercises = Exercise.order(:body_part).find_all{|exercise| exercise.user_id == current_user.id }

    #set tag values for img tag, body_part and weight_type for display on page via attr accessor attributes so as to not persist to db
    @exercises.each do |exercise|
      case exercise.body_part
      when "Legs"
        exercise.body_part_tag = "label-primary"
        exercise.img_tag = "/images/weightlifting-icon-legs.png"
      when "Chest"
        exercise.body_part_tag = "label-success"
        exercise.img_tag = "/images/weightlifting-icon-chest.png"
      when "Shoulders"
        exercise.body_part_tag = "label-info"
        exercise.img_tag = "/images/weightlifting-icon-shoulders.png"
      when "Arms"
        exercise.body_part_tag = "label-warning"
        exercise.img_tag = "/images/weightlifting-icon-arms.png"
      when "Back"
        exercise.body_part_tag = "label-danger"
        exercise.img_tag = "/images/weightlifting-icon-legs.png"
      else
        exercise.body_part_tag = "label-default"
        exercise.img_tag = "/images/weightlifting-icon-abs.png"
      end

      exercise.weight_type_tag = "label-primary"
    end

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

      #set instance variables for user exercises, ordering by body_part for display on view page
      @exercises = Exercise.order(:body_part).find_all{|exercise| exercise.user_id == current_user.id && !@workout.exercises.include?(exercise) }

      #set tag values for img tag, body_part and weight_type for display on page via attr accessor attributes so as to not persist to db
      @exercises.each do |exercise|
        case exercise.body_part
        when "Legs"
          exercise.body_part_tag = "label-primary"
          exercise.img_tag = "/images/weightlifting-icon-legs.png"
        when "Chest"
          exercise.body_part_tag = "label-success"
          exercise.img_tag = "/images/weightlifting-icon-chest.png"
        when "Shoulders"
          exercise.body_part_tag = "label-info"
          exercise.img_tag = "/images/weightlifting-icon-shoulders.png"
        when "Arms"
          exercise.body_part_tag = "label-warning"
          exercise.img_tag = "/images/weightlifting-icon-arms.png"
        when "Back"
          exercise.body_part_tag = "label-danger"
          exercise.img_tag = "/images/weightlifting-icon-legs.png"
        else
          exercise.body_part_tag = "label-default"
          exercise.img_tag = "/images/weightlifting-icon-abs.png"
        end

        exercise.weight_type_tag = "label-primary"
      end

      erb :"/workouts/edit"
    else
      redirect to :"/workouts"
    end
  end

  patch '/workouts/:id' do

    binding.pry

    #find workout and current user and set to instance variables
    workout = Workout.find_by_id(params[:id])

    #update name and description sections with any changes
    workout.name = params[:name]
    workout.description = params[:description]

    #iterate through newly added exercises, adding them to workout
    if !!params[:exercise] && params[:exercise].include?(:id)
      params[:exercise][:id].each do |id|
        exercise = Exercise.find_by_id(id)
        workout.exercises << exercise
      end
    end

    #iterate through current exercise attributes, removing from workout
    if !!params[:exercise] && params[:exercise].include?(:current_exercises)
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
