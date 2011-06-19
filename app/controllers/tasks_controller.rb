class TasksController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy, :show]
  before_filter :authorized_user, :only => :destroy
  
  def create
    @goal = Goal.find(params[:goal_id]) 
    @task  = @goal.tasks.build(params[:task])
    if @task.save
      flash[:success] = "Task created!"
      redirect_to goal_path(@task.goal.id)
    else
      render home_path
    end
  end

  def destroy
    @task.destroy
    redirect_back_or home_path
  end

  def show

  end
 
  def index
    @goal = Goal.find(params[:goal_id])
    @task  = @goal.tasks
  end

  private
  
    def authorized_user
      @goal = Goal.find(params[:goal_id])
      @task = @goal.tasks.find_by_id(params[:id])
      redirect_to 'index.html' if @task.nil?
    end

end
