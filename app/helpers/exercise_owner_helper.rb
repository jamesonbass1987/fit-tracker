module ExerciseOwnerHelper

    def exercise_owner_check
      exercise = Exercise.find_by_id(params[:id])

      if !exercise || (current_user.id != exercise.user_id && !current_user.id.nil?)
        redirect to '/exercises'
      end
    end

    def exercise_set_owner_check
      if (!@exercise.user_id.nil? && @exercise.user_id != @user.id)
        redirect to :"/users/#{@user.username}"
      end
    end

    def exercise_set_workout_check
      if !@user.workouts.any?{|workout| workout.exercises.include?(@exercise)}
        redirect to :"/users/#{@user.username}"
      end
    end

end
