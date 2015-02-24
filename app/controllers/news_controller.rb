class NewsController < ApplicationController
layout "news_layout"
before_action :authenticate_admin!

  def new
  	@news = News.new
  end
  def create
  	@news = News.new(news_params)
    add_links

  	if @news.save
      flash[:success] = "Stworzono aktualność"
  		redirect_to news_index_path
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
      flash[:success] = "Usunięto aktualność"
    else
      flash[:error] = "Nie udało się usunąć aktualności"
    end
    redirect_to news_index_path
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
    add_links

    if @news.update(news_params)
      add_links
      @news.update!(news_params)
      redirect_to news_index_path, notice: "Edytowano aktualność"
    else
      render 'edit'
    end
  end

  def add_links

    @news.text_with_link = @news.text
    if @news.text_with_link.include? "#Menu"
      # puts 'News zawiera Menu'
      @news.text_with_link.sub! '#Menu', '<a href="#menu">Menu</a>'
    elsif @news.text_with_link.include? "#menu"
      # puts 'News nie zawieta Menu'
      @news.text_with_link.sub! '#menu', '<a href="#menu">menu</a>'
    end

    if @news.text_with_link.include? "#Link"
      puts "#Link"
      if !@news.link.include? "http"
        @news.link="http://"+@news.link
      end  
      @news.text_with_link.sub! '#Link', '<a href="'+@news.link+'">'+@news.name_of_link+'</a>'
    elsif @news.text_with_link.include? "#link"
      puts "#link"
      if !@news.link.include? "http"
        @news.link="http://"+@news.link
      end  
      @news.text_with_link.sub! '#link', '<a href="'+@news.link+'">'+@news.name_of_link+'</a>'
    end
  end

  def news_params 
		params.require(:news).permit(:text, :date, :link, :name_of_link)
	end

end
