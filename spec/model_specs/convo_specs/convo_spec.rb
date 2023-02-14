require 'rails_helper'

RSpec.describe Convo, type: :model do
  let(:valid_user) { User.create(email: 'convo@test.com', password: 'testtest', username: 'convo_test_1') }
  let(:second_valid_user) { User.create(email: 'convo2@test.com', password: 'testtest', username: 'convo_test_2') }

  describe 'Convo ' do
    it 'should not be valid if the sender is the same as the receiver' do
      convo = Convo.new(sender: valid_user, receiver: valid_user)
      expect(convo.valid?).to eq false
    end

    it 'should not be valid if a convo between the same two user already exists' do
      Convo.create!(sender: valid_user, receiver: second_valid_user)
      convo_2 = Convo.new(sender: valid_user, receiver: second_valid_user)
      expect(convo_2.valid?).to eq false
    end
  end
end
