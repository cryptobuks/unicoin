require 'rails_helper'

describe 'Main Page' do

  context 'when accessing the main page' do
    scenario 'it has welcome message and log in buttons' do
      visit '/'
      expect(page).to have_content 'Welcome to Unicoin'
    end
    scenario 'you can sign up as a buyer' do
      visit '/'
      click_link 'Buyer Sign Up'
      expect(current_path).to eq '/buyers/sign_up'
    end
    scenario 'you can sign in as a buyer' do
      visit '/'
      click_link 'Buyer Login'
      expect(current_path).to eq '/buyers/sign_in'
    end
    scenario 'you can sign up as a seller' do
      visit '/'
      click_link 'Seller Sign Up'
      expect(current_path).to eq '/sellers/sign_up'
    end
    scenario 'you can sign in as a seller' do
      visit '/'
      click_link 'Seller Login'
      expect(current_path).to eq '/sellers/sign_in'
    end
  end

end
