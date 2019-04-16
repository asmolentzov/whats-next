class UserLikesController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def create
    item = Item.find(params[:user_like][:id])
    UserLike.create(user: current_user, like: item)
  end

end