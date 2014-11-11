class AddTeamToCoach < ActiveRecord::Migration
  def change
    add_reference :coaches, :team, index: true
    add_reference :coaches, :user, index: true
    add_reference :coaches, :workout, index: true

  end
end
