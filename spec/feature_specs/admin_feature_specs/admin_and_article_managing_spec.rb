require 'rails_helper'

RSpec.describe 'Admin and articles', type: :feature do
  describe 'admin dashboard and article validation' do
    let(:admin) { User.create(email: "admin@test.com", password: "123456", username: "admin_dude", admin: true) }
    let(:user) { User.create(email: "not_admin@test.com", password: "123456", username: "not_addy") }

    it 'an article should only be published to article index if admin publishes it' do
      login_as(user)
      visit(new_article_path)
      fill_in 'Title', with: 'This is an eyecatching title'
      fill_in 'Content', with: 'This is another rspec test article.'
      select "ask to be published", from: "Status"
      click_on 'save'
      visit(articles_path)
      expect(page).not_to have_content('This is an eyecatching title')

      login_as(admin)
      visit(articles_for_validation_path)
      click_on('This is an eyecatching title status : ask to be published, by : not_addy')
      select "published", from: "Status"
      click_on "save"
      visit(articles_path)
      expect(page).to have_content('This is an eyecatching title')
    end
  end
end
