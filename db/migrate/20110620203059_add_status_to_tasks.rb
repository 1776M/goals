class AddStatusToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :status, :string, :default => 'to do'
  end

  def self.down
    remove_column :tasks, :status
  end
end
