class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments, :dependent => :destroy
  has_many :workouts, :dependent => :destroy

	acts_as_voter
	acts_as_followable
	acts_as_follower
end
