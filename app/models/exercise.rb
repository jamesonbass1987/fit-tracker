class Exercise < ActiveRecord::Base
  has_many :workout_exercises
  has_many :workouts, through: :workout_exercises
  belongs_to :user
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
end
