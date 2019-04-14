class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:user_name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to profile_path
    else 
      redirect_to root_path
    end
  end
end