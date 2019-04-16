require 'rails_helper'

describe UserSave do
  describe 'Relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:item) }
  end
end