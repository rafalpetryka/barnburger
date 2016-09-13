class BurgersController < ApplicationController
  # skip_before_action :verify_authenticity_token
  layout 'news_layout'
  # before_action :check_cookie
  before_action :authenticate_admin!, only: [:new, :create, :find_burger, :destroy, :edit, :index]

  def index
    @burgers = Burger.all
  end

  def new
    @burger = Burger.new
    # @burger = Burger.where(name: "NAGI INSTYNKT").first
    # @current_burger = Burger.new
    # # @burgers = Burger.find(:all)
    # @burgers = Burger.find_by_id(params[:id])
  end

  def create
    @burger = Burger.new(burger_params)
    @burger.average = 5.0 if @burger.average > 5.0
    @burger.how_many_mark = 5 if @burger.how_many_mark < 1
    @burger.limited = 0
    if @burger.save
      flash[:success] = 'Dodano burgera'
      redirect_to burgers_path
    end
    # check_mark
    # @current_burger = Burger.new(params[:burger])
    # @burger = Burger.where(name: "NAGI INSTYNKT").first
    # @burger.average = (@burger.average * @burger.how_many_mark + @mark) / (@burger.how_many_mark + 1)
    # @burger.how_many_mark = @burger.how_many_mark+1

    # if @burger.save
    # 	flash[:success] = @burger.name + " otrzymał od Ciebie " + @mark.to_s
    # 	redirect_to :back
    # end
  end

  def find_burger
    @current_burger = Burger.find(params[:id])
  end

  def destroy
    @burger = Burger.find(params[:id])
    if @burger.present?
      @burger.destroy
      flash[:success] = 'Usunięto burgera'
    else
      flash[:success] = 'Nie udało się usunąć burgera'
    end
    redirect_to burgers_path
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

    if @mark.zero?
      if @burger.update(burger_params)
        flash[:success] = 'Zaktualizowano burgera'
        redirect_to burgers_path
      else
        render 'edit'
      end
    else
      if cookies[@burger.name].blank?
        puts '-----------------'
        puts 'else2'
        puts '-----------------'
        cookies[@burger.name] = {
          value: @mark.to_s
        }
        flash[:success] = @burger.name + ' otrzymał od Ciebie ' + @mark.to_s
        @burger.average = (@burger.average * @burger.how_many_mark + @mark) / (@burger.how_many_mark + 1)
        @burger.how_many_mark = @burger.how_many_mark + 1
      else

        if cookies[@burger.name].to_i == @mark.to_i
          puts '-----------------'
          puts 'if'
          puts '-----------------'
          flash[:success] = 'Twoja ocena ' + @burger.name + ' nie zmieniła się ' + @mark.to_s
        else
          puts '-----------------'
          puts 'else'
          puts '-----------------'
          flash[:success] = 'Twoja ocena ' + @burger.name + ' została zmieniona na ' + @mark.to_s
          @cookie_mark = cookies[@burger.name]
          @burger.average = (@burger.average * @burger.how_many_mark + @mark - @cookie_mark.to_i) / @burger.how_many_mark
          cookies[@burger.name] = {
            value: @mark.to_s
          }
        end
      end

      puts cookies[@burger.name]

      if @burger.save
        puts '-----------------'
        puts 'save'
        puts '-----------------'
        # flash[:success] = @burger.name + " otrzymał od Ciebie " + @mark.to_s
        redirect_to root_path(anchor: 'menu')
      end
    end
  end

  def burger_params
    params.require(:burger).permit(:name, :composition, :price, :how_many_mark, :average)
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
