class AddIndexToGoals < ActiveRecord::Migration
  def self.up
      add_index :goals, :user_id
      add_index :goals, :created_at
  end

  def self.down
  end
end
