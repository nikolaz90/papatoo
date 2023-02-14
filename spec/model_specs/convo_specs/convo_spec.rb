require 'rails_helper'

RSpec.describe Convo, type: :model do
  let(:valid_user) { User.create(email: 'convo@test.com', password: 'testtest', username: 'convo_test_1') }
  let(:second_valid_user) { User.create(email: 'convo2@test.com', password: 'testtest', username: 'convo_test_2') }

  describe 'Convo ' do
    it 'should not be valid if the user is the same' do
      convo = Convo.new(sender: valid_user, receiver: valid_user)
      expect(convo.valid?).to eq false
    end
  end

end
