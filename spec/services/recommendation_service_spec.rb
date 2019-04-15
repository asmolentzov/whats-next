require 'rails_helper'

describe RecommendationService do
  it 'can get recommendations' do
    service = RecommendationService.new
    book = Item.create(name: "Harry Potter", item_type: 'book')
    recs = service.get_recommendations(book)[:Similar][:Results]
    
    expect(recs.count).to eq(20)
    expect(recs.first).to have_key(:Name)
    expect(recs.first).to have_key(:Type)
    expect(recs.first).to have_key(:wTeaser)
    expect(recs.first).to have_key(:wUrl)
    expect(recs.first).to have_key(:yUrl)
    expect(recs.first).to have_key(:yID)
  end
end