class SearchController < ApplicationController
  def show
    recs = RecommendationService.new.get_recommendations(Item.create(name: "Harry Potter", item_type: 'book'))
    @recommendations = recs[:Similar][:Results].map do |rec|
      Item.find_or_create_by(name: rec[:Name], item_type: rec[:Type])
    end
  end
end
