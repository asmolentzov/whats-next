class SearchController < ApplicationController
  def show
    @recommendations = RecommendationService.get_recommendations
  end
end
