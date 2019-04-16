class UserLikesController < ApplicationController

  def create
    item = Item.find(params[:user_like][:id])
    UserLike.create(user: current_user, like: item)
  end

end