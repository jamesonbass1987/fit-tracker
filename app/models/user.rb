class User < ActiveRecord::Base
  validates_presence_of :username, :email, :password
  has_secure_password
  has_many :workouts
  has_many :exercises
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
end
