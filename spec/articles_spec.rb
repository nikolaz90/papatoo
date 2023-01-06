require 'rails_helper'

RSpec.describe Article, type: :model do
  user = User.create(email: 'test@test.com', password: 'testtest')
  describe 'article can be created by user' do
    article = Article.new(user: user)
    it "has created a valid article" do
      expect(article.valid?).to eq true
    end
  end
end
