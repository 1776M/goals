class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :content
      t.integer :goal_id

      t.timestamps
    end
      add_index :tasks, :goal_id
      add_index :tasks, :created_at
  end

  def self.down
    drop_table :tasks
  end
end
