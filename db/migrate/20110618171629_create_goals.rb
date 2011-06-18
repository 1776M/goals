class CreateGoals < ActiveRecord::Migration
  def self.up
    create_table :goals do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :goals
  end
end
