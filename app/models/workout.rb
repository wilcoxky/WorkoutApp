class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :destroy
  validates :title, presence:true
  validates :excercise, length: { minimum: 10 }
  acts_as_voteable
end
