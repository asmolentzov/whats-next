require 'rails_helper' 

describe 'As a visitor to the site' do
  describe 'on the root page' do
    it 'can log in' do
      user = User.create(name: 'user', password: 'password')
      
      visit root_path
      
      fill_in :user_name, with: user.name
      fill_in :user_password, with: user.password
      click_button 'Log In'
      
      expect(current_path).to eq(profile_path)
      expect(page).to have_content(user.name)
    end
  end
end