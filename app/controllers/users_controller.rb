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

  def update
    @user = User.find(params[:id])
    if @user.update_attribute(user_params)
      redirect_to user_path(@user), notice: 'User updated'
    else
      render action: 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
