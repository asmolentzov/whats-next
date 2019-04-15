class SearchController < ApplicationController
  def show
    @facade = SearchFacade.new
  end
end
