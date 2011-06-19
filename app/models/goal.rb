class Goal < ActiveRecord::Base

	attr_accessible :content

	belongs_to :user
	has_many :tasks, :dependent => :destroy

	validates :content, :presence => true
 	validates :user_id, :presence => true

	default_scope :order => 'goals.created_at DESC'
end
