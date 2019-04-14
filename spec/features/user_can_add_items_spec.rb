require 'rails_helper'

describe 'As a user on the site' do
  describe 'on the main page' do
    it 'can add a new item to my Things I Like' do
      user = User.create(name: 'user')
      visit profile_path(user)
      
      expect(page).to have_content('Things I Like')
      expect(page).to_not have_content('The Golden Compass')
      
      fill_in :item_name, with: 'the golden compass'
      select 'book', from: 'item_type'
      click_button 'Add New'
      
      within "#books-likes" do
        expect(page).to have_content('The Golden Compass')
      end
    end
  end
end