module ExerciseSetHelpers

    def set_user_exercise_set_vars
      @user = current_user
      @exercise = Exercise.find_by_id(params[:exercise_id])
      @sets = @exercise.exercise_sets
    end

end
