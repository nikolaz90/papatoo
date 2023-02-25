require 'rails_helper'

RSpec.describe 'Dashboard test', type: :feature do
  describe 'dashboard' do
    let(:user) { User.create(email: "article@test.com", password: "123456", username: "aloha_guy") }

    it 'is not accessible to users that are not signed in' do
      visit(dashboard_index_path)
      expect(page).to have_content('Log in')
    end

    it 'is accessible to users that are signed in' do
      login_as(user)
      visit(dashboard_index_path)
      expect(page).to have_content('dashboard')
    end
  end
end
