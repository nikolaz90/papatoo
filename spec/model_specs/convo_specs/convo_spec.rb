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

    it 'should have a class method that retrieves convos between two users' do
      third_user = User.create(email: 'convo3@test.com', password: 'testtest', username: 'convo_test_3')
      convo = Convo.create!(sender: valid_user, receiver: second_valid_user)
      Convo.create!(sender: valid_user, receiver: third_user)

      expect(Convo.between(valid_user.id, second_valid_user.id).first).to eq convo
      expect(Convo.between(valid_user.id, third_user.id).length).to eq 1
    end

    it 'convo.correspondant_has_deleted_account should return true if receiver or sender no longer has an account' do
      convo = Convo.create!(sender: valid_user, receiver: second_valid_user)
      valid_user.destroy
      expect(convo.correspondant_has_deleted_account).to eq true
    end
  end
end
