require 'rails_helper'

## issues with selenium to be resolved... causing errors

RSpec.describe 'Welcome to papatoo', type: :system do
  describe 'index page' do
    it 'shows the right content' do
      visit(root_path)
      expect(page).to have_content('Welcome to Papatoo.info')
    end
  end
end
