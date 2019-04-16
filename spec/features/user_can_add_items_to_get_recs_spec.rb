require 'rails_helper'

describe 'As a user' do
  describe 'on the profile page' do
    it 'can add items from Things I Like to Get Recommendations', js: true do
      user = User.create(name: 'user', password: 'pass')
      hp = user.items.create(name: 'Harry Potter', item_type: 'book')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit profile_path
      
      within "#item-#{hp.id}" do
        click_on 'Get Recommendation'
      end
      
      within "#staging-box" do
        expect(page).to have_content(hp.name)
      end
    end
  end
end