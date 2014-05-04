class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :destroy
  validates :title, presence:true
  validates :excercise, length: { minimum: 10 }
  acts_as_voteable

  # Sort methods for Workout Index Page
  scope :top, -> { plusminus_tally.order('plusminus_tally DESC').limit(15)}
  scope :by_newest, -> { order('created_at DESC').limit(15)}
  scope :by_cat, -> { order(:category).limit(20)}
  scope :by_user, -> { order(:user_id).limit(20)}
end
