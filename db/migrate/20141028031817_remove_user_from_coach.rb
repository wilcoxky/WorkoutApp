class RemoveUserFromCoach < ActiveRecord::Migration
  def change
    remove_reference :coaches, :user, index: true
  end
end
