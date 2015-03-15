class EnglishLimitedBurgersController < ApplicationController
	layout "news_layout"
	before_action :authenticate_admin!

	def index
		@english_limited_burger = EnglishLimitedBurger.all
	end

	def new
		@english_limited_burger = EnglishLimitedBurger.new
	end

	def create
		@english_limited_burger = EnglishLimitedBurger.new(english_limited_burger_params)
		@english_limited_burger.average1 = 4.7
		@english_limited_burger.how_many_mark1 = 4
		@english_limited_burger.average2 = 4.7
		@english_limited_burger.how_many_mark2 = 4
		if @english_limited_burger.save
			flash[:success] = "Dodano edycję limitowaną po angielsku"
			redirect_to english_limited_burgers_path
		end
		
		# @burger.create(name: @english_limited_burger.name1, composition: @english_limited_burger.composition1, price: @english_limited_burger.price1, how_many_mark: 4, average: 4.7)
		# @burger.create(name: @english_limited_burger.name2, composition: @english_limited_burger.composition2, price: @english_limited_burger.price2, how_many_mark: 4, average: 4.7)
		@english_sezonowy_burger_1 = EnglishBurger.new()
		@english_sezonowy_burger_1.name = @english_limited_burger.name1
		@english_sezonowy_burger_1.composition = @english_limited_burger.composition1
		@english_sezonowy_burger_1.price = @english_limited_burger.price1
		@english_sezonowy_burger_1.how_many_mark = 4
		@english_sezonowy_burger_1.average = 4.7
		@english_sezonowy_burger_1.limited = true
		@english_sezonowy_burger_1.save

		@english_sezonowy_burger_2 = EnglishBurger.new
		@english_sezonowy_burger_2.name = @english_limited_burger.name2
		@english_sezonowy_burger_2.composition = @english_limited_burger.composition2
		@english_sezonowy_burger_2.price = @english_limited_burger.price2
		@english_sezonowy_burger_2.how_many_mark = 4
		@english_sezonowy_burger_2.average = 4.7
		@english_sezonowy_burger_2.limited = true
		@english_sezonowy_burger_2.save
	end

	def show
		@english_limited_burger = EnglishLimitedBurger.find(params[:id])
	end

	def edit
		@english_limited_burger = EnglishLimitedBurger.find(params[:id])
	end

	def destroy
		@english_limited_burger = EnglishLimitedBurger.find(params[:id])
		if @english_limited_burger.present?
			@english_limited_burger.destroy
			flash[:success] = "Usunięto edycję limitowaną po angielsku"
		else
			flash[:error] = "Nie udało się usunąć edycji limitowanej po angielsku"
		end
		redirect_to english_limited_burgers_path
	end



	def update
		@english_limited_burger = EnglishLimitedBurger.find(params[:id])
		if @english_limited_burger.update(english_limited_burger_params)
			flash[:success] = "Zaktualizowano edycję limitowaną po angielsku"
			redirect_to english_limited_burgers_path
		else
			render 'edit'
		end
	end

	def english_limited_burger_params
		params.require(:english_limited_burger).permit(:date, :date_on_website, :name1, :name2, :composition1, :composition2, :price1, :price2, :how_many_mark1, :how_many_mark2, :average1, :average2)
	end

end
