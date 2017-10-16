class Exercise < ActiveRecord::Base
  has_many :workout_exercises
  has_many :workouts, through: :workout_exercises
  has_many :exercise_exercise_sets
  has_many :exercise_sets, through: :exercise_exercise_sets
  extend Slugifiable::ClassMethods
end
