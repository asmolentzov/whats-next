class UsersController < ApplicationController
  def show
    @books = current_user.items.where(type: :book)
  end
  
  private
  
  def current_user
    
  end
end