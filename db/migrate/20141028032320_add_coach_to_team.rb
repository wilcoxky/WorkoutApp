class AddCoachToTeam < ActiveRecord::Migration
  def change
    add_reference :teams, :coaches, index: true
  end
end
