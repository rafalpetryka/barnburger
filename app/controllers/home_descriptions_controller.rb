class HomeDescriptionsController < ApplicationController
  before_action :find_home_description, only: [:update, :edit]
  before_action :authenticate_admin!
  layout 'news_layout'
  def index
    @home_description = HomeDescription.last
  end
  def update
    if @home_description.save
      flash[:success] = "Zaktualizowano opis ze strony głównej"
      redirect_to manager_path
    else
      flash[:error] = "Nie udało się zaktualizować opisu"
      render 'edit'
    end
  end
  private
  def find_home_description
    @home_description = HomeDescription.find(params[:id])
  end
  def home_description_params
    params(:home_description).permit(:polish_title, :english_title, :polish_text, :english_text)
  end
end
