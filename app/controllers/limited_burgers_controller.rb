class LimitedBurgersController < ApplicationController
	layout "news_layout"
	before_action :authenticate_admin!

	def index
		@limited_burger = LimitedBurger.all
	end

	def new
		@limited_burger = LimitedBurger.new
	end

	def create
		@limited_burger = LimitedBurger.new(limited_params)

		if @limited_burger.save
			flash[:success] = "Dodano limitowaną edycję"
			redirect_to limited_index_path
		end
	end

	def show
		@limited_burger = LimitedBurger.find(params[:id])
	end

	def edit
		@limited_burger = LimitedBurger.find(parmas[:id])
	end

	def limited_params
		params.require(:limited).permit(:date, :date_on_website, :name1, :name2, :composition1, :composition2)
	end
end
