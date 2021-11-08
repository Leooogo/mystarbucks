class FavoriteDrinksController < ApplicationController

  before_action :authorized, only:[:create]
  def index
    favorite_drink = Favorite_Drink.find_by(params[:user_id])
    favorite_drinks = Favorite_Drink.all
  end
end
