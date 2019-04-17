require 'rails_helper'

describe 'As a user' do
  describe 'on the search results page' do
    it 'can save recommendations', js: true, vcr: true do
      user = User.create(name: "Harry", password: "password")
      movie = user.items.create(name: "Spirited Away", item_type: "movie")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit search_path(query: movie.id)
      
      item = Item.last
      within "#recommendation-#{item.id}" do
        click_on 'Save'
      end
      sleep(1) # Added so that the database call gets a chance to execute
      expect(UserLike.last.like).to eq(item)
    end
    it 'can see saved recommendations', js: true, vcr: true do
      user = User.create(name: "Harry", password: "password")
      movie = user.items.create(name: "Spirited Away", item_type: "movie")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit search_path(query: movie.id)
      
      expect(UserLike.all).to eq([])
      item = Item.last
      item_2 = Item.all[-2]
      within "#recommendation-#{item_2.id}" do
        click_on 'Save'
      end
      sleep(1)
      click_on 'Things To Check Out'
      
      within('.saved-items') do
        expect(page).to have_content(item_2.name)
        expect(page).to_not have_content(item.name)
      end
      expect(UserLike.all.count).to eq(1)
      expect(UserLike.last.like ).to eq(item_2)
    end
  end
end