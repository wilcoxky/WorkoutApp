class AddCoachToWorkout < ActiveRecord::Migration
  def change
    add_reference :workouts, :coaches, index: true
  end
end
