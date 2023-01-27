require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'A can create a location' do
    let(:valid_user) { User.create(email: 'location@test.com', password: 'testtest', username: 'location_test_1') }

    it 'should not be valid without a user' do
      location = Location.new(long: 0.00, lat: 0.00)
      expect(location.valid?).to eq false
    end

    it 'should not be valid without long and lat' do
      location = Location.new(user: valid_user)
      expect(location.valid?).to eq false
    end

    it 'should not be valid without start time' do
      location = Location.new(user: valid_user, long: 0.00, lat: 0.00)
      expect(location.valid?).to eq false
    end

    it 'user should be able to create a valid location' do
      location = Location.new(user: valid_user, long: 0.00, lat: 0.00, start_time: Time.now + 2.days)
      expect(location.valid?).to eq true
    end

    it 'should be have a default duration of 30' do
      location = Location.new(long: 0.00, lat: 0.00, user: valid_user)
      expect(location.duration).to eq 30
    end

    it 'user should have access to locations' do
      location = Location.create(user: valid_user, long: 0.00, lat: 0.00, start_time: Time.now + 2.days)
      expect(valid_user.locations.first).to eq location
    end
  end
end
