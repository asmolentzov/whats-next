class UsersController < ApplicationController
  def show
    @books = current_user.items.where(item_type: :book)
  end
end