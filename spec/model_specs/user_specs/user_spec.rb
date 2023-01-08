require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user should have the correct information' do
    let(:valid_user) { User.create(email: 'test@test.com', password: 'testtest') }

    it 'user should have an associated email' do
      expect(valid_user.email).to eq 'test@test.com'
    end

    it 'user should have access to their own articles' do
      user = User.new(email: 'test@user.com', password: '123456')
      user.save
      article_one = Article.new(user: user, title: 'article 1')
      article_one.save
      expect(user.articles.length).to eq 1
      expect(user.articles.last.title).to eq Article.last.title
    end
  end
end
