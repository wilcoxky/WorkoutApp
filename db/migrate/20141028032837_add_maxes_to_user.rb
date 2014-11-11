class AddMaxesToUser < ActiveRecord::Migration
  def change
    add_column :users, :Bench, :string
    add_column :users, :Squat, :string
    add_column :users, :Deadlift, :string
    add_column :users, :PowerClean, :string
  end
end
