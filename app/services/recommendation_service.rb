class RecommendationService
  def get_recommendations(item)
    conn = Faraday.new(url: 'https://tastedive.com')
    response = conn.get('/api/similar') do |faraday|
      faraday.params[:k] = ENV['TASTEDIVE_API_KEY']
      faraday.params[:q] = "#{item.item_type}:#{item.name}"
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end