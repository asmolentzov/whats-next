require 'rails_helper'

describe RecommendationService do
  it 'can get recommendations based on one item', :vcr do
    service = RecommendationService.new
    book = Item.create(name: "Harry Potter", item_type: 'book')
    recs = service.get_recommendations([book])[:Similar][:Results]
    
    expect(recs.count).to eq(20)
    expect(recs.first).to have_key(:Name)
    expect(recs.first).to have_key(:Type)
    expect(recs.first).to have_key(:wTeaser)
    expect(recs.first).to have_key(:wUrl)
    expect(recs.first).to have_key(:yUrl)
    expect(recs.first).to have_key(:yID)
  end
  it 'can get recommendations based on multiple items', :vcr do
    service = RecommendationService.new
    book = Item.create(name: "Harry Potter", item_type: 'book')
    movie = Item.create(name: 'Spirited Away', item_type: 'movie')
    book_2 = Item.create(name: 'Pride and Prejudice', item_type: 'book')
    recs = service.get_recommendations([book, movie, book_2])[:Similar][:Results]
    
    expect(recs.count).to eq(20)
    expect(recs.first).to have_key(:Name)
    expect(recs.first).to have_key(:Type)
    expect(recs.first).to have_key(:wTeaser)
    expect(recs.first).to have_key(:wUrl)
    expect(recs.first).to have_key(:yUrl)
    expect(recs.first).to have_key(:yID)
    expect(recs.last).to have_key(:Name)
    expect(recs.last).to have_key(:Type)
    expect(recs.last).to have_key(:wTeaser)
    expect(recs.last).to have_key(:wUrl)
    expect(recs.last).to have_key(:yUrl)
    expect(recs.last).to have_key(:yID)
  end
end