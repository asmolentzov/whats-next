require 'rails_helper'

describe 'As a user' do
  describe 'on my profile page' do
    it 'can see recommendations based on Harry Potter', :vcr do
      user = User.create(name: "Harry", password: "password")
      hp = user.items.create(name: "Harry Potter", item_type: "book")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit search_path(query: hp.id)
      
      within ".reco-container" do
        expect(page).to have_content("We Think You'll Like")
        expect(page).to have_css(".recommendation", count: 20)
      end
    end
    it 'can get recommendations based on any added items', js: true, vcr: true do
      user = User.create(name: "Harry", password: "password")
      movie = user.items.create(name: 'Spirited Away', item_type: 'movie')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit profile_path
      
      within "#item-#{movie.id}" do
        click_on 'Get Recommendation'
      end
      within '.recs-container' do
        click_on 'Get Recommendations!'
      end
      
      expect(current_path).to eq(search_path)
      within ".reco-container" do
        expect(page).to have_content("We Think You'll Like")
        expect(page).to have_css(".recommendation", count: 20)
        expect(page).to have_content('My Neighbor Totoro')
        expect(page).to have_content('Princess Mononoke')
      end
    end
  end
end