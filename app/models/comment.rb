class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :workout
  validates :body , presence: true
  acts_as_voteable
end
