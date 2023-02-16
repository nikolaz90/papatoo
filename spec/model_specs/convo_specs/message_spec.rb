require 'rails_helper'

RSpec.describe Convo, type: :model do
  let(:valid_user) { User.create(email: 'message@test.com', password: 'testtest', username: 'message_test_1') }
  let(:second_valid_user) { User.create(email: 'message2@test.com', password: 'testtest', username: 'message_test_2') }

  it 'should delete all messages if user deletes account' do
    convo = Convo.create!(sender: valid_user, receiver: second_valid_user)
    Message.create!(user: valid_user, content: "Hey!", convo: convo)
    Message.create!(user: second_valid_user, content: "hi!", convo: convo)
    Message.create!(user: valid_user, content: "Hey!", convo: convo)
    expect(Message.count).to eq 3
    valid_user.destroy
    expect(Message.count).to eq 1
    expect(Message.where(user: valid_user).count).to eq 0
  end
end
