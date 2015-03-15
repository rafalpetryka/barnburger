class EnglishNewsController < ApplicationController
  layout "news_layout"
  before_action :authenticate_admin!

  def new
  	@english_news = EnglishNews.new
  end
  def create
  	@english_news = EnglishNews.new(english_news_params)
    add_links

  	if @english_news.save
      flash[:success] = "Stworzono aktualność po angielsku"
  		redirect_to english_news_index_path
  	end
  end
  def index
  	@english_news = EnglishNews.all
  end
  def show
    @english_news = EnglishNews.find(params[:id])
  end
  def destroy
    @english_news = EnglishNews.find(params[:id])
    if @english_news.present?
      @english_news.destroy
      flash[:success] = "Usunięto aktualność po angielsku"
    else
      flash[:error] = "Nie udało się usunąć aktualności po angielsku"
    end
    redirect_to english_news_index_path
    # @english_news.EnglishNews.find(params[:id])
    # redirect_to root_path, notice: "Successfully deleted recipe"
  end
  def edit
    @english_news = EnglishNews.find(params[:id])
  end
  def find_news
    # @recipe = Recipe.find(params[:id])
    @english_news = EnglishNews.find(params[:id])
  end

  def update
    @english_news = EnglishNews.find(params[:id])
    add_links

    if @english_news.update(english_news_params)
      add_links
      @english_news.update!(english_news_params)
      redirect_to english_news_index_path, notice: "Edytowano aktualność po angielsku"
    else
      render 'edit'
    end
  end

  def add_links

    @english_news.text_with_link = @english_news.text
    if @english_news.text_with_link.include? "#Menu"
      # puts 'EnglishNews zawiera Menu'
      @english_news.text_with_link.sub! '#Menu', '<a href="#menu">Menu</a>'
    elsif @english_news.text_with_link.include? "#menu"
      # puts 'EnglishNews nie zawieta Menu'
      @english_news.text_with_link.sub! '#menu', '<a href="#menu">menu</a>'
    end

    if @english_news.text_with_link.include? "#Link"
      puts "#Link"
      if !@english_news.link.include? "http"
        @english_news.link="http://"+@english_news.link
      end  
      @english_news.text_with_link.sub! '#Link', '<a href="'+@english_news.link+'">'+@english_news.name_of_link+'</a>'
    elsif @english_news.text_with_link.include? "#link"
      puts "#link"
      if !@english_news.link.include? "http"
        @english_news.link="http://"+@english_news.link
      end  
      @english_news.text_with_link.sub! '#link', '<a href="'+@english_news.link+'">'+@english_news.name_of_link+'</a>'
    end
  end

  def english_news_params 
	params.require(:english_news).permit(:text, :date, :link, :name_of_link)
  end
end
