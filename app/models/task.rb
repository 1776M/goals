class Task < ActiveRecord::Base

	attr_accessible :content

	belongs_to :goal

	validates :content, :presence => true
 	validates :goal_id, :presence => true

	default_scope :order => 'tasks.created_at DESC'
end
