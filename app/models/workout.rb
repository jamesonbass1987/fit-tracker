class Workout < ActiveRecord::Base
  belongs_to :users
  has_many :workout_exercises
  has_many :exercises, through: :workout_exercises
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
end
