class MainController < ApplicationController
  def index
  	@current_burger = Burger.new
  	# @burger = Burger.where(name: "SIR BURGER").first
  	@news = News.all
  	@limited_burgers = LimitedBurger.all
  	@limited_burgers_from_burger = Burger.where(limited: true)
  	@burgers = Burger.where(limited: false)
 #  	@previous_burger = Burger.where('id < ?', params[:id]).last
	# @next_burger = Burger.where('id > ?', params[:id]).first
  end

end
