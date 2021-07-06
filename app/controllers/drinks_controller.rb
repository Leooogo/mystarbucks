class DrinksController < ApplicationController
  before_action : set_drink, only: [:show, :edit, :update, :destroy]
  
  def index
    @drinks = Drink.all
  end

  def show
    @drink = Drink.find(params[:id])
  end

  def new
    @drink = Drink.new
  end

  def create
    @drink = Drink.new(drink_params)
    @drink.save

    redirect_to drink_path(@drink)
  end

  def edit
    @drink = Drink.find(params[:id])
  end

  def update
    @drink = Drink.find(params[:id])
    @drink.update(drink_params)

    redirect_to drink_path(@drink)
  end

  def destroy
    @drink = Drink.find(params[:id])
    @drink.destroy

    redirect_to drinks_path
  end

  private

  def drink_params
    params.require(:drink).permit(:name, :description, :rating)
  end

  def set_drink
    @drink = Drink.find(params[:id])
  end
end