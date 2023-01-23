require 'rails_helper'

RSpec.describe 'Create a new article', type: :feature do
  describe 'articles pages' do
    let(:user) { User.create(email: "article@test.com", password: "123456", username: "aloha_guy") }

    it 'should not allow user to go to write new article page' do
      visit(new_article_path)
      expect(page).to have_content('Log in')
    end

    it 'should not create an article without a title' do
      login_as(user)
      visit(new_article_path)
      fill_in 'Content', with: 'This is a rspec test article.'
      click_on 'save'
      expect(page).to have_content('Write a new article')
    end

    it 'should allow user to create an article and see it in the dashboard page' do
      login_as(user)
      visit(new_article_path)
      fill_in 'Title', with: 'This is an eyecatching title'
      fill_in 'Content', with: 'This is another rspec test article.'
      click_on 'save'
      expect(page).to have_content('articles')
      expect(page).to have_content('This is an eyecatching title')
    end
  end
end
