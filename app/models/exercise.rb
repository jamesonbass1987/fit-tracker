class Exercise < ActiveRecord::Base
  belongs_to :user
  has_many :workout_exercises
  has_many :workouts, through: :workout_exercises
  has_many :exercise_sets
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  attr_accessor :body_part_tag, :weight_type_tag, :img_tag
end
