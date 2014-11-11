class RemoveCoachFromWorkout < ActiveRecord::Migration
  def change
    remove_reference :workouts, :coaches, index: true
  end
end
