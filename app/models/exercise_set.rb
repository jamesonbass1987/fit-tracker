class ExerciseSet < ActiveRecord::Base
  has_many :exercises_exercise_sets
  has_many :exercises, through: :exercise_exercise_sets
  extend Slugifiable::ClassMethods
end
