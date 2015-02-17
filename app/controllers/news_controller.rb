class NewsController < ApplicationController

  def new
  	@news = News.new
  end
  def create
  	@news = News.new(news_params)
  	if @news.save
  		redirect_to new_news_path
  	end
  end
  def index
  	@news = News.all
  end
  def show
    # @news = News.find(params[:id])
  end
  def news_params 
		params.require(:news).permit(:text)
	end

end
