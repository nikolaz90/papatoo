require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'article can be created by user' do
    let(:valid_user) { User.create(email: 'test@test.com', password: 'testtest') }

    it "has created a valid article" do
      article = Article.new(user: valid_user)
      expect(article.valid?).to eq true
    end

    it "should not validate an article without a user" do
      article = Article.new
      expect(article.valid?).to eq false
    end

    it "should not validate an article without a title" do
      article = Article.new(user: valid_user)
      expect(article.valid?).to eq false
    end

    it "should give articles a default status of 'draft'" do
      article = Article.new(user: valid_user, title: "A good read")
      expect(article.valid?).to eq true
      expect(article.status).to eq 'draft'
    end
  end
end
