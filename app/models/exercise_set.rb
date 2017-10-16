class ExerciseSet < ActiveRecord::Base
  belongs_to :exercise
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
end
