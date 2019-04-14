class UserItemsController < ApplicationController
  def create
    item = Item.find_or_create_by(name: params[:item_name], item_type: params[:item_type].to_i)
    redirect_to profile_path
  end
end