class ExercisesController < ApplicationController

  get '/exercises' do
    logged_in_redirect_check

    #set instance variables based on exercise body part
    @legs = Exercise.all.find_all { |exercise| exercise.body_part == "Legs"}
    @chest = Exercise.all.find_all { |exercise| exercise.body_part == "Chest"}
    @shoulders = Exercise.all.find_all { |exercise| exercise.body_part == "Shoulders"}
    @arms = Exercise.all.find_all { |exercise| exercise.body_part == "Arms"}
    @back = Exercise.all.find_all { |exercise| exercise.body_part == "Back"}
    @abdominals = Exercise.all.find_all { |exercise| exercise.body_part == "Abdominals"}

    erb :"/exercises/index"
  end

  get '/exercises/new' do
    logged_in_redirect_check

    erb :"/exercises/create"
  end

  post '/exercises' do

    erb :"/exercises/#{@exercise.id}"
  end

  get '/exercises/:id' do
    logged_in_redirect_check
    @exercise = Exercise.find_by_id(params[:id])

    erb :"/exercises/show"
  end

  get '/exercises/:id/edit' do
    logged_in_redirect_check

    erb :"/exercises/edit"
  end

  patch '/exercises/:id' do

    redirect to :"/exercises/#{@exercise.id}"
  end

  delete '/exercises/:id/delete' do

    redirect to "/exercises"
  end

end
