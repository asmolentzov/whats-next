require 'rails_helper'

describe User do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:password) }
  end
  
  describe 'Relationships' do
    it { should have_many(:user_items) }
    it {should have_many(:items).through(:user_items) }
  end
end