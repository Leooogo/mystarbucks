class UsersController < ApplicationController

  def show
    if params[:id]
      user = User.find(params[:id])
    else
      user = current_user
    end
  end

  def edit
    # @user = User.find(params[:id], :conditions => ['opened_once => ?', false]) rescue ActiveRecord::RecordNotFound
    # @user.update_attribute :opened_once, true
  end

end
