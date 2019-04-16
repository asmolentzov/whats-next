class SearchController < ApplicationController
  def show
    @facade = SearchFacade.new(params[:query])
  end
end
