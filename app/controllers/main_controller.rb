class MainController < ApplicationController
  def index
  	@news = News.all
  	@limited_burger = LimitedBurger.all
  end
end
