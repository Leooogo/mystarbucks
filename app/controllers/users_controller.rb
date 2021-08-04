class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @drinks = Drink.joins(:favorites).where('favorites.user_id = ?', @user.id)
    # if params[:id]
    #   user = User.find(params[:id])
    # else
    #   user = current_user
    # end
  end

  def edit
    # @user = User.find(params[:id], :conditions => ['opened_once => ?', false]) rescue ActiveRecord::RecordNotFound
    # @user.update_attribute :opened_once, true
  end

end
