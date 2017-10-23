class Exercise < ActiveRecord::Base
  belongs_to :user
  has_many :workout_exercises
  has_many :workouts, through: :workout_exercises
  has_many :exercise_sets

  attr_accessor :body_part_tag, :img_tag
end
