class UserItemsController < ApplicationController
  def create
    redirect_to profile_path
  end
end