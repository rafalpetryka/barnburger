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
		@limited_burger = LimitedBurger.new(limited_burger_params)
		if @limited_burger.save
			flash[:success] = "Dodano limitowaną edycję"
			redirect_to limited_burgers_path
		end
	end

	def show
		@limited_burger = LimitedBurger.find(params[:id])
	end

	def edit
		@limited_burger = LimitedBurger.find(params[:id])
	end

	def destroy
		@limited_burger = LimitedBurger.find(params[:id])
		if @limited_burger.present?
			@limited_burger.destroy
			flash[:success] = "Usunięto limitowaną edycję"
		else
			flash[:error] = "Nie udało się usunąć edycji limitowanej"
		end
		redirect_to limited_burgers_path
	end



	def update
		@limited_burger = LimitedBurger.find(params[:id])

		if @limited_burger.update(limited_burger_params)
			# change_date_on_website

			# @limited_burger.update!(limited_burger_params)
			redirect_to limited_burgers_path, notice: "Edytowano limitowaną edycję"
		else
			render 'edit'
		end
	end

	def limited_burger_params
		params.require(:limited_burger).permit(:date, :date_on_website, :name1, :name2, :composition1, :composition2, :price1, :price2)
	end

	#zle dziala
	def check_if_names_have_price
		
	end
end
