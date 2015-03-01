class MainController < ApplicationController
  def index
  	@current_burger = Burger.new
  	@burger = Burger.where(name: "NAGI INSTYNKT").first
  	@news = News.all
  	@limited_burger = LimitedBurger.all
  end
end
