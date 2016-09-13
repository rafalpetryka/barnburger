class MainController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:index]
  def index
    if cookies['_barnburger_session'].to_s == ''
      cookies['_barnburger_session'] = 'temp'
    end
    @current_burger = Burger.new
    @news = News.all
    @english_news = EnglishNews.all
    @limited_burgers = LimitedBurger.all
    @limited_burgers_from_burger = Burger.where(limited: true)
    @burgers = Burger.where(limited: false)
    @english_burgers = EnglishBurger.where(limited: false)
    @english_limited_burgers = EnglishLimitedBurger.all

    home_description = HomeDescription.last
    if home_description.present?
      if I18n.locale.to_s == 'pl'
        @home_description_title = home_description.polish_title
        @home_description_text = home_description.polish_text
      else
        @home_description_title = home_description.english_title
        @home_description_text = home_description.english_text
      end
    else
      @home_description_title = t('real_story.title')
      @home_description_text = t('real_story.description')
    end
  end
end
