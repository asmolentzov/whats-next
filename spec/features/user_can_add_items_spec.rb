require 'rails_helper'

describe 'As a user on the site' do
  describe 'on the main page' do
    it 'can add a new item to my Things I Like' do
      user = User.create(name: 'user', password: 'pass')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit profile_path
      
      expect(page).to have_content('Things I Like')
      expect(page).to_not have_content('The Golden Compass')
      
      fill_in :item_name, with: 'the golden compass'
      select 'book', from: 'item_type'
      click_button 'Add New'
      
      within "#book-likes" do
        expect(page).to have_content('The Golden Compass')
      end
    end
    it 'can add a new item of any category to my Things I Like' do
      user = User.create(name: 'user', password: 'pass')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit profile_path

      fill_in :item_name, with: 'red hot chili peppers'
      select 'music', from: 'item_type'
      click_button 'Add New'
      within "#music-likes" do
        expect(page).to have_content('Red Hot Chili Peppers')
      end
      
      fill_in :item_name, with: 'Spirited Away'
      select 'movie', from: 'item_type'
      click_button 'Add New'
      within '#movie-likes' do
        expect(page).to have_content('Spirited Away')
      end
      
      fill_in :item_name, with: 'Buffy the vampire slayer'
      select 'show', from: 'item_type'
      click_button 'Add New'
      within '#show-likes' do
        expect(page).to have_content('Buffy The Vampire Slayer')
      end
      
      fill_in :item_name, with: 'Reply All'
      select 'podcast', from: 'item_type'
      click_button 'Add New'
      within '#podcast-likes' do
        expect(page).to have_content('Reply All')
      end
      
      fill_in :item_name, with: 'Gabriel Garcia Marquez'
      select 'author', from: 'item_type'
      click_button 'Add New'
      within '#author-likes' do
        expect(page).to have_content('Gabriel Garcia Marquez')
      end
      
      fill_in :item_name, with: '7 Wonders'
      select 'game', from: 'item_type'
      click_button 'Add New'
      within '#game-likes' do
        expect(page).to have_content('7 Wonders')
      end
    end
  end
end