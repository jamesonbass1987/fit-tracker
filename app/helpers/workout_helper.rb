module WorkoutHelpers

    def workout_id_parser
      parsed_url = request.url.split("workout_id=").last
      @workout_id = parsed_url unless parsed_url.include?("http")
      @workout_id ||= 'null'
    end

end
