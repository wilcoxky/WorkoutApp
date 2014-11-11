class RemoveCoachFromTeam < ActiveRecord::Migration
  def change
    remove_reference :teams, :coaches, index: true
  end
end
