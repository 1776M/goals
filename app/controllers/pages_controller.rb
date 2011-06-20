class PagesController < ApplicationController

  def home
       @title = 'home'
	@goal = Goal.new if signed_in?
       @goals = current_user.goals if signed_in?
  end

  def about
	@title = "About"
  end

end
