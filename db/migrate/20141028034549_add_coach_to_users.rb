class AddCoachToUsers < ActiveRecord::Migration
  def change
    add_column :users, :coach, :boolean, :default => false
  end
end
