class NewsController < ApplicationController

  def new
  	@news = News.new
  end
  def create
  	@news = News.new(news_params)
    if @news.text.include? "Menu"
      # puts 'News zawiera Menu'
      @news.text.sub! 'Menu', '<a href="#menu">Menu</a>'
    elsif @news.text.include? "menu"
      # puts 'News nie zawieta Menu'
      @news.text.sub! 'menu', '<a href="#menu">menu</a>'
    end
  	if @news.save
  		redirect_to news_index
  	end
  end
  def index
  	@news = News.all
  end
  def show
    @news = News.find(params[:id])
  end
  def destroy
    @news = News.find(params[:id])
    if @news.present?
      @news.destroy
    end
    redirect_to root_url
    # @news.News.find(params[:id])
    # redirect_to root_path, notice: "Successfully deleted recipe"
  end
  def edit
    @news = News.find(params[:id])
  end
  def find_news
    # @recipe = Recipe.find(params[:id])
    @news = News.find(params[:id])
  end

  def update
    @news = News.find(params[:id])
    if @news.update(news_params)
      redirect_to news_path, notice: "Edytowano aktualność"
    else
      render 'edit'
    end
  end

  def news_params 
		params.require(:news).permit(:text, :date)
	end

end
