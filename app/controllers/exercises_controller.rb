class ExercisesController < ApplicationController

  get '/exercises' do
    logged_in_redirect_check

    #set instance variables for user exercises, ordering by body_part for display on view page
    @exercises = Exercise.order(:body_part).find_all{|exercise| exercise.user_id == current_user.id }

    #set tag values for img tag, body_part and weight_type for display on page via attr accessor attributes so as to not persist to db
    exercise_img_label_tagger

    erb :"/exercises/index"
  end

  get '/exercises/new' do
    logged_in_redirect_check

    erb :"/exercises/create"
  end

  post '/exercises' do
    #create instance variable from submitted information
    @exercise = Exercise.new(:name => params[:name], :body_part => params[:body_part], :weight_type => params[:weight_type])
    @user_exercises = Exercise.all.find_all{ |exercise| exercise.user_id == current_user.id}

    #search current list of user exercises for perfect duplicates. if so, reload page with error
    @duplicate_exercise = @user_exercises.find{|exercise| (exercise.name == @exercise.name && exercise.body_part == @exercise.body_part && exercise.weight_type == @exercise.weight_type)}

    if !@duplicate_exercise
      #associate created exercise to user
      current_user.exercises << @exercise

      #save exercise instance to DB
      @exercise.save

      redirect to "/exercises/#{@exercise.id}"
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

    #validate exercise exists and belongs to user
    exercise_validation

    #parse url to retrieve workout id to redirect user to after editing set
    workout_id_parser

    erb :"/exercises/show"
  end

  get '/exercises/:id/edit' do
    logged_in_redirect_check

    @exercise = Exercise.find_by_id(params[:id])

    #validate exercise exists and belongs to user
    exercise_validation

    erb :"/exercises/edit"
  end

  patch '/exercises/:id' do

    #create instances of exercise and user exercises
    @exercise, exercise_edits = Exercise.find_by_id(params[:id]), Exercise.find_by_id(params[:id])
    @user_exercises = Exercise.all.find_all{ |exercise| exercise.user_id == current_user.id}

    #if any parameters have changed, create new variable (exercise_edits) to check if exercise matches previously created exercises
    if @exercise.name != params[:name] || @exercise.body_part != params[:body_part] || @exercise.weight_type != params[:weight_type]
      exercise_edits.name = params[:name]
      exercise_edits.body_part = params[:body_part]
      exercise_edits.weight_type = params[:weight_type]
    end

    #check to see if any exercises currently exist with the same name belonging to the current user
    @duplicate_exercise = @user_exercises.find{|exercise| exercise.name == exercise_edits.name && exercise.body_part == exercise_edits.body_part && exercise.weight_type == exercise_edits.weight_type && exercise.id != params[:id].to_i}

    #if no duplicate is found, save to db and redirect to exercises overview, else, throw error and redirect to edit page
    if !@duplicate_exercise
      #save changes to db
      exercise_edits.save

      redirect to "/exercises/#{@exercise.id}"
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
