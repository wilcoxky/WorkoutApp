class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :title
      t.text :excercise
      t.belongs_to :user, index: true
      t.string :category

      t.timestamps
    end
  end
end
