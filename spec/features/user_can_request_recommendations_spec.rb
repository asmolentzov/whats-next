require 'rails_helper'

describe 'As a user' do
  describe 'on my profile page' do
    it 'can see recommendations based on Harry Potter' do
      user = User.create(name: "Harry", password: "password")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit search_path
      
      within ".reco-container" do
        expect(page).to have_content("We Think You'll Like")
        expect(page).to have_css(".recommendation", count: 20)
      end
    end
  end
end