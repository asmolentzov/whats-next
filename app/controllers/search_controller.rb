class SearchController < ApplicationController
  def show
    @facade = SearchFacade.new(params[:query])
    @books = current_user.items.where(item_type: :book)
    @movies = current_user.items.where(item_type: :movie)
    @shows = current_user.items.where(item_type: :show)
    @podcasts = current_user.items.where(item_type: :podcast)
    @authors = current_user.items.where(item_type: :author)
    @games = current_user.items.where(item_type: :game)
    @music = current_user.items.where(item_type: :music)
  end
end
