require 'rails_helper'

describe UserLike do
  describe 'Relationships' do
    it { should belong_to(:user) }
  end
end