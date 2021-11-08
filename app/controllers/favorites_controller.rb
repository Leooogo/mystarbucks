class FavoritesController < ApplicationController

  before_action :set_drink

  def create
    if Favorite.create(favorited: @drink, user: current_user)
      redirect_to @drink, notice: 'Drink favorited'
    else
      redirect_to @drinnk, alert: 'Something went wrong.'
    end
  end

  def destroy
    Favorite.where(favorited_id: @drink.id, user_id: current_user.id).first.destroy
    redirect_to @drink, notice: 'Drink unfavorited.'
  end

  private

  def set_drink
    @drink = Drink.find(par)
  end

end