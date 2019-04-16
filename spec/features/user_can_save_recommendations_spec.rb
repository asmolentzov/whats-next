require 'rails_helper'

describe 'As a user' do
  describe 'on the search results page' do
    it 'can save recommendations', :vcr do
      user = User.create(name: "Harry", password: "password")
      movie = user.items.create(name: "Spirited Away", item_type: "movie")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit search_path(query: movie.id)
      
      item = Item.last
      within "#recommendation-#{item.id}" do
        click_on 'Save'
      end
      require 'pry'; binding.pry
      expect(UserLike.last.item).to eq(item)
    end
  end
end