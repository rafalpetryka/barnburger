class BurgersController < ApplicationController
	layout "news_layout"
	def new
		# @burger = Burger.where(name: "NAGI INSTYNKT").first
		# @current_burger = Burger.new
		# # @burgers = Burger.find(:all)
		# @burgers = Burger.find_by_id(params[:id])
	end

	def create
		check_mark
		@current_burger = Burger.new(params[:burger])
		@burger = Burger.where(name: "NAGI INSTYNKT").first
		@burger.average = (@burger.average * @burger.how_many_mark + @mark) / (@burger.how_many_mark + 1)
		@burger.how_many_mark = @burger.how_many_mark+1
		
		if @burger.save
			flash[:success] = @burger.name + " otrzymał od Ciebie " + @mark.to_s
			redirect_to :back
		end
	end

	def find_burger
		@current_burger = Burger.find(params[:id])
	end

	def show
	end

	def edit
		# @burger = Burger.where(name: "NAGI INSTYNKT").first
		@current_burger = Burger.new
		# @burgers = Burger.find(:all)
		@burger = Burger.find(params[:id])
	end

	def update
		check_mark
		@burger = Burger.find(params[:id])
		@burger.average = (@burger.average * @burger.how_many_mark + @mark) / (@burger.how_many_mark + 1)
		@burger.how_many_mark = @burger.how_many_mark+1
		
		if @burger.save
			flash[:success] = @burger.name + " otrzymał od Ciebie " + @mark.to_s
			redirect_to :root
		end
	end

	def burger_params
		params.require(:burger).permit(:name, :composition, :price, :how_many_mark, :average)
	end

	def check_mark
		@mark = 0
		if params[:one_star]
			@mark = 1
		elsif params[:two_star]
			@mark = 2
		elsif params[:three_star]
			@mark = 3
		elsif params[:four_star]
			@mark = 4
		elsif params[:five_star]
			@mark = 5
		end
	end
end
