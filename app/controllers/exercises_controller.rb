class ExercisesController < ApplicationController

  get '/exercises' do
    logged_in_redirect_check

    #set instance variables based on exercise body part

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

    erb :"/exercises/index"
  end

  get '/exercises/new' do
    logged_in_redirect_check

    erb :"/exercises/create"
  end

  post '/exercises' do
    #create instance variable from submitted information
    @exercise = Exercise.new(:name => params[:name], :body_part => params[:body_part], :weight_type => params[:weight_type])
    @user = current_user
    @user_exercises = Exercise.all.find_all{ |exercise| exercise.user_id == current_user.id}


    #search current list of user exercises for perfect duplicates. if so, reload page with error
    @duplicate_exercise = @user_exercises.find{|exercise| (exercise.name == @exercise.name && exercise.body_part == @exercise.body_part && exercise.weight_type == @exercise.weight_type)}

    if !@duplicate_exercise
      #associate created exercise to user
      @user.exercises << @exercise

      #save exercise instance to DB
      @exercise.save

      redirect to '/exercises'
    else
      @exercise_creation_error = true
      erb :"/exercises/create"
    end
  end

  get '/exercises/:id' do
    logged_in_redirect_check

    @exercise = Exercise.find_by_id(params[:id])
    @sets = @exercise.exercise_sets
    @set_num = 0

    if @exercise && @exercise.user_id == current_user.id
      erb :"/exercises/show"
    else
      redirect to :"/exercises"
    end
  end

  get '/exercises/:id/edit' do
    logged_in_redirect_check

    @exercise = Exercise.find_by_id(params[:id])

    #check to see if exerise exists and current user created this exercise and is allowed to edit
    if @exercise && @exercise.user_id == current_user.id
      erb :"/exercises/edit"
    else
      redirect to :"/exercises"
    end
  end

  patch '/exercises/:id' do

    #create instances of exercise and user exercises
    @exercise, exercise_edits = Exercise.find_by_id(params[:id]), Exercise.find_by_id(params[:id])
    @user_exercises = Exercise.all.find_all{ |exercise| exercise.user_id == current_user.id}

    #update parameters if any have changed
    if @exercise.name != params[:name] || @exercise.body_part != params[:body_part] || @exercise.weight_type != params[:weight_type]
      exercise_edits.name = params[:name]
      exercise_edits.body_part = params[:body_part]
      exercise_edits.weight_type = params[:weight_type]
    end

    #check to see if any exercises currently exist with the same name belonging to the current user
    @duplicate_exercise = @user_exercises.find{|exercise| exercise.name == exercise_edits.name && exercise.body_part == exercise_edits.body_part && exercise.weight_type == exercise_edits.weight_type && exercise.id != params[:id].to_i}

    #if no dupliate is found, save to db and redirect to exercises overview, else, throw error and redirect to edit page
    if !@duplicate_exercise
      #save changes to db
      exercise_edits.save

      redirect to :"/exercises"
    else
      @exercise_edit_error = true
      erb :"/exercises/edit"
    end

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
