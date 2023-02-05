require 'rails_helper'

RSpec.describe 'Home page rspec test', type: :feature do
  describe 'home page' do
    it 'shows a welcome message with right content' do
      visit(root_path)
      expect(page).to have_content('AT')
    end
  end
end
