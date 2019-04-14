require 'rails_helper'

describe Item do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:type) }
  end
end