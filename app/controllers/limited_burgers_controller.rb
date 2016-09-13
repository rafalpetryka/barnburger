class LimitedBurgersController < ApplicationController
  layout 'news_layout'
  before_action :authenticate_admin!

  def index
    @limited_burger = LimitedBurger.all
  end

  def new
    @limited_burger = LimitedBurger.new
  end

  def create
    @limited_burger = LimitedBurger.new(limited_burger_params)
    @limited_burger.average1 = 4.7
    @limited_burger.how_many_mark1 = 4
    @limited_burger.average2 = 4.7
    @limited_burger.how_many_mark2 = 4
    if @limited_burger.save
      flash[:success] = 'Dodano edycję limitowaną'
      redirect_to limited_burgers_path
    end

    # @burger.create(name: @limited_burger.name1, composition: @limited_burger.composition1, price: @limited_burger.price1, how_many_mark: 4, average: 4.7)
    # @burger.create(name: @limited_burger.name2, composition: @limited_burger.composition2, price: @limited_burger.price2, how_many_mark: 4, average: 4.7)
    @sezonowy_burger_1 = Burger.new
    @sezonowy_burger_1.name = @limited_burger.name1
    @sezonowy_burger_1.composition = @limited_burger.composition1
    @sezonowy_burger_1.price = @limited_burger.price1
    @sezonowy_burger_1.how_many_mark = 4
    @sezonowy_burger_1.average = 4.7
    @sezonowy_burger_1.limited = true
    @sezonowy_burger_1.save

    @sezonowy_burger_2 = Burger.new
    @sezonowy_burger_2.name = @limited_burger.name2
    @sezonowy_burger_2.composition = @limited_burger.composition2
    @sezonowy_burger_2.price = @limited_burger.price2
    @sezonowy_burger_2.how_many_mark = 4
    @sezonowy_burger_2.average = 4.7
    @sezonowy_burger_2.limited = true
    @sezonowy_burger_2.save
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
      flash[:success] = 'Usunięto edycję limitowaną'
    else
      flash[:error] = 'Nie udało się usunąć edycji limitowanej'
    end
    redirect_to limited_burgers_path
  end

  def update
    @limited_burger = LimitedBurger.find(params[:id])
    if @limited_burger.update(limited_burger_params)
      flash[:success] = 'Zaktualizowano edycję limitowaną'
      redirect_to limited_burgers_path
    else
      render 'edit'
    end
  end

  def limited_burger_params
    params.require(:limited_burger).permit(:date, :date_on_website, :name1, :name2, :composition1, :composition2, :price1, :price2, :how_many_mark1, :how_many_mark2, :average1, :average2)
  end

  def burger_params
    params.require(:burger).permit(:name, :composition, :price, :how_many_mark, :average)
  end
end
