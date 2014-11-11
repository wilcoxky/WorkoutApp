class AddTeamToWorkout < ActiveRecord::Migration
  def change
    add_reference :workouts, :team, index: true
  end
end
