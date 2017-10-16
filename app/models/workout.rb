class Workout < ActiveRecord::Base
  has_many :user_workouts
  has_many :users, through: :user_workouts
  has_many :workout_exercises
  has_many :exercises, through: :workout_exercises
  extend Slugifiable::ClassMethods
end
