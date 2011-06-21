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
    @task = Task.find(params[:id])
    Task.find(params[:id]).destroy
    flash[:success] = "Task deleted"
    redirect_to goal_path(@task.goal.id)
  end

  def show
    @task = Task.find(params[:id])  
  end
 
  def index
    @goal = Goal.find(params[:goal_id])
    @task  = @goal.tasks
  end

  def finish
       @task = Task.find(params[:id])
       @task.update_attributes(:status => "done")
       redirect_to goal_path(@task.goal.id)
  end

  def unfinish
       @task = Task.find(params[:id])
       @task.update_attributes(:status => "to do")
       redirect_to goal_path(@task.goal.id)
  end

  private
  
    def authorized_user
      @task = Task.find(params[:id])
      redirect_to 'index.html' if @task.nil?
    end

end
