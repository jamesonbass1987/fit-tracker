module WorkoutHelpers

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
