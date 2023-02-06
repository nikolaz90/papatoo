require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'article can be created by user' do
    let(:valid_user) { User.create(email: 'test@test.com', password: 'testtest', username: 'test_') }

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

    it 'user should have access to their own articles' do
      article_one = Article.new(user: valid_user, title: 'article 1')
      article_one.save
      expect(valid_user.articles.length).to eq 1
      expect(valid_user.articles.last.title).to eq Article.last.title
    end

    it 'if user deletes account, all articles written by user are deleted' do
      random_user = User.create(email: "rand@o.com", password: "random_person", username: "rand")
      article_one = Article.create(user: random_user, title: 'article 2')
      expect { random_user.destroy }.to change { Article.count }.by(-1)
    end

    it 'article_vocabulary_flagger should return articles with rude words' do
      rude_article = Article.create(user: valid_user, title: 'article 2', content: 'this is a mean article shit!!')
      expect(ArticleVocabularyFlagger.find_articles_with_inappropriate_language.first).to eq rude_article
    end
  end
end
