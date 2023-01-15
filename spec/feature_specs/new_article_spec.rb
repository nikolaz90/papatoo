require 'rails_helper'

RSpec.describe 'Create a new article', type: :feature do
  describe 'articles pages' do
    let(:user) { User.create(email: "article@test.com", password: "123456") }

    it 'should not create an article without a title' do
      login_as(user)
      visit(new_article_path)
      # finish writing test
    end
  end
end
