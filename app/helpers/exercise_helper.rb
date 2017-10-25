module ExerciseHelpers

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


end
