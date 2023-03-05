require 'rails_helper'

RSpec.describe 'Portfolio Articles api v1', type: :request do
  describe 'get index in json' do
    it 'returns an up to date hash of articles' do
      PortfolioArticle.create!(title: 'testing this out!', description: 'another great event in history', url: '123.com')
      get api_v1_portfolio_articles_path
      expect(response.body).to include '123.com'
      expect(response.body).to include 'testing this out!'
    end
  end
end
