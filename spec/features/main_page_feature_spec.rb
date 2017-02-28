require 'rails_helper'

describe 'Main Page' do

  context 'when accessing the main page' do
    scenario 'it has welcome message and log in buttons' do
      visit '/'
      expect(page).to have_content 'Welcome to Unicoin'
      expect(page).to have_link 'Sign in'
    end
  end



end
