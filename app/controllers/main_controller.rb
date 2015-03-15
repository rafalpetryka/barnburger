class MainController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:index]
  def index
    if cookies["_barnburger_session"].to_s == ""
      cookies["_barnburger_session"] = "temp"
    end
  	@current_burger = Burger.new
  	# @burger = Burger.where(name: "SIR BURGER").first
  	@news = News.all
    @english_news = EnglishNews.all
  	@limited_burgers = LimitedBurger.all
  	@limited_burgers_from_burger = Burger.where(limited: true)
  	@burgers = Burger.where(limited: false)
    @english_burgers = EnglishBurger.where(limited: false)
    @english_limited_burgers = EnglishLimitedBurger.all
 #  	@previous_burger = Burger.where('id < ?', params[:id]).last
	# @next_burger = Burger.where('id > ?', params[:id]).first

    
  
  end

end
