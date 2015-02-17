class MainController < ApplicationController
  def index
  	@news = News.all
  end
end
