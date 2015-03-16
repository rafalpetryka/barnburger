class EnglishBurgersController < ApplicationController
	# skip_before_action :verify_authenticity_token
	layout "news_layout"
	# before_action :check_cookie
	before_action :authenticate_admin!

	def index
		@english_burgers = EnglishBurger.all
	end

	def new
		@english_burger = EnglishBurger.new
		# @english_burger = EnglishBurger.where(name: "NAGI INSTYNKT").first
		# @english_current_burger = EnglishBurger.new
		# # @english_burgers = EnglishBurger.find(:all)
		# @english_burgers = EnglishBurger.find_by_id(params[:id])
	end

	def create
		@english_burger = EnglishBurger.new(english_burger_params)
		@english_burger.average = 5.0 if @english_burger.average > 5.0
		@english_burger.how_many_mark = 5 if @english_burger.how_many_mark < 1
		@english_burger.limited = 0
		if @english_burger.save
			flash[:success] = "Dodano burgera po angielsku"
			redirect_to english_burgers_path
		end
		# check_mark
		# @english_current_burger = EnglishBurger.new(params[:burger])
		# @english_burger = EnglishBurger.where(name: "NAGI INSTYNKT").first
		# @english_burger.average = (@english_burger.average * @english_burger.how_many_mark + @mark) / (@english_burger.how_many_mark + 1)
		# @english_burger.how_many_mark = @english_burger.how_many_mark+1
		
		# if @english_burger.save
		# 	flash[:success] = @english_burger.name + " otrzymał od Ciebie " + @mark.to_s
		# 	redirect_to :back
		# end
	end

	def find_burger
		@english_current_burger = EnglishBurger.find(params[:id])
	end

	def destroy
		@english_burger = EnglishBurger.find(params[:id])
		if @english_burger.present?
			@english_burger.destroy
			flash[:success] = "Usunięto burgera po angielsku"
		else
			flash[:success] = "Nie udało się usunąć burgera po angielsku"
		end
		redirect_to english_burgers_path
	end

	def show
	end

	def edit
		# @english_burger = EnglishBurger.where(name: "NAGI INSTYNKT").first
		@english_current_burger = EnglishBurger.new
		# @english_burgers = EnglishBurger.find(:all)
		@english_burger = EnglishBurger.find(params[:id])
	end

	def update
		check_mark
		@english_burger = EnglishBurger.find(params[:id])
		
		unless @mark == 0
			unless cookies[@english_burger.name].blank?
				
				if cookies[@english_burger.name].to_i == @mark.to_i
					puts "-----------------"
					puts "if"
					puts "-----------------"
					flash[:success] = "Your mark "+ @english_burger.name + " is the same as before " + @mark.to_s
				else 
					puts "-----------------"
					puts "else"
					puts "-----------------"
					flash[:success] = "Your mark "+ @english_burger.name + " was changed to " + @mark.to_s
					@cookie_mark = cookies[@english_burger.name]
					@english_burger.average = (@english_burger.average * @english_burger.how_many_mark + @mark - @cookie_mark.to_i) / (@english_burger.how_many_mark)
					cookies[@english_burger.name] = {
			    		:value => @mark.to_s
			    	}
				end
			else
				puts "-----------------"
					puts "else2"
					puts "-----------------"
				cookies[@english_burger.name] = {
			    	:value => @mark.to_s
			    } 
				flash[:success] = @english_burger.name + " received " + @mark.to_s + " from You"
				@english_burger.average = (@english_burger.average * @english_burger.how_many_mark + @mark) / (@english_burger.how_many_mark + 1)
				@english_burger.how_many_mark = @english_burger.how_many_mark+1
			end

			puts cookies[@english_burger.name]

			if @english_burger.save
				puts "-----------------"
					puts "save"
					puts "-----------------"
				# flash[:success] = @english_burger.name + " otrzymał od Ciebie " + @mark.to_s
				redirect_to menu_path
			end
		else
			if @english_burger.update(english_burger_params)
				flash[:success] = "Zaktualizowano burgera po angielsku"
				redirect_to english_burgers_path
			else
				render 'edit'
			end
		end
	end

	def english_burger_params
		params.require(:english_burger).permit(:name, :composition, :price, :how_many_mark, :average)
	end

	# def check_cookie
	# 	respond_to do |format|
	#     format.js { render :js => "my_function();" }
	# end
	# end

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
