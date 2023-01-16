require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user should have the correct information' do
    let(:valid_user) { User.create(email: 'test@test.com', password: 'testtest', username: 'tester_4') }

    it 'user should have an associated email' do
      expect(valid_user.email).to eq 'test@test.com'
    end
  end
end
