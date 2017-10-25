class User < ActiveRecord::Base
  has_many :workouts
  has_many :exercises
  has_many :exercise_sets, through: :exercises

  has_secure_password
  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
end
