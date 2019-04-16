class SearchFacade
  
  def initialize(query_params)
    @items = query_params.split(',').map { |id| Item.find(id) }
  end
  
  def recommendations
    @recommendations = raw_recommendations.map do |rec|
      Item.find_or_create_by(name: rec[:Name], item_type: rec[:Type])
    end
  end
  
  def raw_recommendations
    RecommendationService.new.get_recommendations(@items.first)[:Similar][:Results]
  end
end