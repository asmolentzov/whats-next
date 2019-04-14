require 'rails_helper'

describe Item do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:item_type) }
  end
  
  describe 'Relationships' do
    it { should have_many(:user_items) }
  end
end