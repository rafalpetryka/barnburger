class OpeningHoursController < ApplicationController
  layout 'news_layout'
  before_action :authenticate_admin!
  before_action :find_opening_hour, only: [:edit, :update]
  def index
    @opening_hours = OpeningHour.all
  end

  def new

  end

  def edit
    @hours = ['00','01','02','03','04','05','06','07','08','09',10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]
    @minutes = ["00","05",10,15,20,25,30,35,40,45,50,55]
    @days_of_week = {
      monday: "Poniedziałek",
      tuesday: "Wtorek",
      wednesday: "Środa",
      thursday: "Czwartek",
      friday: "Piątek",
      saturday: "Sobota",
      sunday: "Niedziela"
    }
  end

  def update
    if @opening_hour.update_attributes(
         monday: hours_and_minutes_from_params(:monday),
         tuesday: hours_and_minutes_from_params(:tuesday),
         wednesday: hours_and_minutes_from_params(:wednesday),
         thursday: hours_and_minutes_from_params(:thursday),
         friday: hours_and_minutes_from_params(:friday),
         saturday: hours_and_minutes_from_params(:saturday),
         sunday: hours_and_minutes_from_params(:sunday)
       )
      flash[:success] = "Zaktualizowano godziny otwarcia #{@opening_hour.place}"
      redirect_to opening_hours_path
    else
      flash[:error] = 'Nie udało się zaktualizować godzin otwarcia'
      render 'edit'
    end
  end

  private
  def hours_and_minutes_from_params(day)
    [
      params[day.to_s + "_11"] + params[day.to_s + "_12"],
      params[day.to_s + "_21"] + params[day.to_s + "_22"],
      params[day.to_s + "_31"] + params[day.to_s + "_32"]
    ]
  end
  def find_opening_hour
    @opening_hour = OpeningHour.find(params[:id])
  end
  def opening_hour_params
    paras.require(:opening_hours).permit(:place, :monday, :tuesday, :wednesday, :thursday, :friday, :satruday, :sunday)
  end
end
