class RecommendationService
  def get_recommendations(items)
    response = conn.get('/api/similar') do |faraday|
      faraday.params[:info] = 1
      faraday.params[:q] = query_params(items)
    end
    JSON.parse(response.body, symbolize_names: true)
  end
  
  private
  
  def conn
    @_conn ||= Faraday.new(url: 'https://tastedive.com') do |faraday|
      faraday.params[:k] = ENV['TASTEDIVE_API_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end
  
  def query_params(items)
    items.map do |item|
      "#{item.item_type}:#{item.name}"
    end.join(',')
  end
end