class UsersController < ApplicationController
  def edit
    # @user = User.find(params[:id], :conditions => ['opened_once => ?', false]) rescue ActiveRecord::RecordNotFound
    # @user.update_attribute :opened_once, true
  end
end
