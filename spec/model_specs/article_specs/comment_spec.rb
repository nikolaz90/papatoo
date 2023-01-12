require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'A user can leave a comment on an article' do
    let(:valid_user) { User.create(email: 'test@test.com', password: 'testtest') }

    it 'should not be valid without a user' do
      comment = Comment.new(content: "interesting article")
      expect(comment.valid?).to eq false
    end

    it 'should not be valid without content' do
      comment = Comment.new(user: valid_user)
      expect(comment.valid?).to eq false
    end

    it 'should be valid if it has a user and belongs to an article' do
      second_user = User.create(email: "second@user.com", password: "123456")
      article = Article.new(user: second_user, title: "the life of pi was great! this is why.")
      comment = Comment.new(user: valid_user, content: "interesting article", article: article)
      expect(comment.user.email).to eq "test@test.com"
      expect(comment.article.title).to eq "the life of pi was great! this is why."
    end
  end
end
