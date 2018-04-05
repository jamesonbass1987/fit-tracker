require './config/environment'

class ApplicationController < Sinatra::Base
  
	configure do
		set :public_folder, 'public'
		set :views, 'app/views'
    enable :sessions
    set :session_secret, "fit_tracker_security"
  end

  helpers do

    def exercise_validation
      if !@exercise || current_user != @exercise.user
        redirect to '/exercises'
      end
    end

    def exercise_img_label_tagger
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
      end
    end

    def logged_in?
      !!current_user
    end

    def current_user #=> User Instance || nil
      @current_user ||= User.find_by_id(session[:user_id])
    end

    def nil_submission?
      params.any? {|key, value| value == "" }
    end

    def user_exists?
      User.any?{|user| user.username == params[:username]} || User.any?{|user| user.email == params[:email]}
    end

    def logged_in_redirect_check
      if !logged_in?
        redirect to '/login'
      end
    end

    def profile_page_redirect
      if logged_in?
        redirect to "/users/#{current_user.username}"
      end
    end

    def workout_id_parser
      parsed_url = request.url.split("workout_id=").last
      @workout_id = parsed_url unless parsed_url.include?("http")
      @workout_id ||= 'null'
    end

    def workout_validation
      if !@workout || @workout.user_id != current_user.id
        redirect to :"/workouts"
      end
    end

  end

  get "/" do
    if logged_in?
      redirect to :"/users/#{current_user.username}"
    else
      erb :index
    end
  end

end
