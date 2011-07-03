class PagesController < ApplicationController

  def home
       @title = 'home'
	@goal = Goal.new if signed_in?
       @goals = current_user.goals if signed_in?
       @user = current_user if signed_in?
       @goals_finished = @user.goal_finished(current_user.id) if signed_in?
       @goals_unfinished = @user.goal_unfinished(current_user.id) if signed_in?
  end

  def about
	@title = "About"
  end

end
