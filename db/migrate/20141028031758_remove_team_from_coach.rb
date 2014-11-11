class RemoveTeamFromCoach < ActiveRecord::Migration
  def change
    remove_reference :coaches, :team, index: true
  end
end
