class HomeDescriptionsController < ApplicationController
  before_action :find_home_description, only: [:update, :edit]
  before_action :authenticate_admin!
  layout 'news_layout'
  def index
    @home_description = HomeDescription.last
  end

  def update
    if @home_description.update(home_description_params)
      flash[:success] = 'Zaktualizowano opis ze strony głównej'
      redirect_to home_descriptions_path
    else
      flash[:error] = 'Nie udało się zaktualizować opisu'
      render 'edit'
    end
  end

  private

  def find_home_description
    @home_description = HomeDescription.find(params[:id])
  end

  def home_description_params
    params.require(:home_description).permit(:polish_title, :english_title, :polish_text, :english_text)
  end
end
