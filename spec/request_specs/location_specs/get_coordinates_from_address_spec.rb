require 'rails_helper'

RSpec.describe 'Get coordinates from address', type: :request do
  describe 'get coordinates' do
    it 'give a string and receive an array of coordinates' do
      expected = [48.6868471, 5.8956243].to_json
      get get_coordinates_from_address_path, params: { address: "croix de chaveau" }
      expect(response.body).to eq expected
    end
  end
end
