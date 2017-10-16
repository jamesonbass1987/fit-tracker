class User < ActiveRecord::Base
  validates_presence_of :username, :email, :password
  has_secure_password
  has_many :user_workouts
  has_many :workouts, through: :user_workouts
  extend Slugifiable::ClassMethods
end
