class MainController < ApplicationController
  def index
  	@current_burger = Burger.new
  	# @burger = Burger.where(name: "SIR BURGER").first
  	@news = News.all
  	@limited_burger = LimitedBurger.all
  	@burgers = Burger.all
  	@previous_burger = Burger.where('id < ?', params[:id]).last
	@next_burger = Burger.where('id > ?', params[:id]).first
  end

end
