class GoalsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy, :show]
  before_filter :authorized_user, :only => :destroy
  
  def create
    @goal  = current_user.goals.build(params[:goal])
    if @goal.save
      flash[:success] = "Goal created!"
      redirect_to home_path 
    else
      render home_path
    end
  end

  def destroy
    @goal.destroy    
    redirect_back_or home_path 
  end

  def show
       @title = 'tasks'
       @goal = Goal.find(params[:id])
       @tasks = @goal.tasks
	@task = Task.new if signed_in?
       @tasks_finished = @goal.task_finished(params[:id])
	@tasks_unfinished = @goal.task_unfinished(params[:id])      
  end

  def finish
       @goal = Goal.find(params[:id])
       @goal.update_attributes(:status => "done")
       redirect_to home_path
  end

  def unfinish
       @goal = Goal.find(params[:id])
       @goal.update_attributes(:status => "to do")
       redirect_to home_path
  end


  private
  
    def authorized_user
      @goal = current_user.goals.find_by_id(params[:id])
      redirect_to 'index.html' if @goal.nil?
    end

end


