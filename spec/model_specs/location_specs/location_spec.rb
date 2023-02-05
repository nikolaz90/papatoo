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

    it 'location should reverse geocode and have correct address provided from the long lat values' do
      location = Location.create(user: valid_user,  long: 0.9254070101469551, lat: 48.913246140591184, start_time: Time.now + 2.days)
      expect(location.address).to eq "Rue du Château Eau, La Butte, Nagel-Séez-Mesnil, Évreux, Eure, Normandy, Metropolitan France, 27190, France"
    end
  end
end
