class SearchFacade
  def recommendations
    @recommendations = raw_recommendations.map do |rec|
      Item.find_or_create_by(name: rec[:Name], item_type: rec[:Type])
    end
  end
  
  def raw_recommendations
    RecommendationService.new.get_recommendations(Item.create(name: "Harry Potter", item_type: 'book'))[:Similar][:Results]
  end
end