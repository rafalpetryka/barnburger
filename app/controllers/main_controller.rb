class MainController < ApplicationController
  def index
  	@current_burger = Burger.new
  	@burger = Burger.where(name: "NAGI INSTYNKT").first
  	@news = News.all
  	@limited_burger = LimitedBurger.all

  	@previous_burger = Burger.where('id < ?', params[:id]).last
	@next_burger = Burger.where('id > ?', params[:id]).first
  end
end
