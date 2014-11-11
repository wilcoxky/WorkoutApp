class Coach < ActiveRecord::Base
	 has_many :workouts, :dependent => :destroy
end
