class Goal < ActiveRecord::Base

	attr_accessible :content, :status

	belongs_to :user
	has_many :tasks, :dependent => :destroy

	validates :content, :presence => true
 	validates :user_id, :presence => true

	default_scope :order => 'goals.created_at DESC'

	def task_finished(id)
           total = Task.find_by_sql(["Select * from Tasks where status='done' and goal_id=?", id])	
       end

       def task_unfinished(id)
           total = Task.find_by_sql(["Select * from Tasks where status='to do' and goal_id=?", id])
       end	

end
