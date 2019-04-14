class UserItemsController < ApplicationController
  def create
    current_user.items.find_or_create_by(user_item_params)
    redirect_to profile_path
  end
  
  private
  
  def user_item_params
    {name: params[:item_name].titleize, item_type: params[:item_type].to_i}
  end
end