class AddStatusToGoals < ActiveRecord::Migration
  def self.up
    add_column :goals, :status, :string, :default => 'to do'
  end

  def self.down
    remove_column :goals, :string
  end
end

