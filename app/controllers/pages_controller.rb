class PagesController < ApplicationController

  def home
       @title = 'home'
	@goal = Goal.new if signed_in?
       @goals = current_user.goals
  end

  def about
	@title = "About"
  end

end
