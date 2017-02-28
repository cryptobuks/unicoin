require 'rails_helper'

describe 'Buyer' do

  context 'A buyer can sign up' do
    scenario 'a buyer fills in a form to sign up' do
      visit '/buyers/sign_up'
      save_and_open_page
      fill_in 'Name', with: 'Mike'
      fill_in 'Email', with: 'mike@test.com'
      fill_in 'Password', with: 'abc123'
      fill_in 'Password confirmation', with: 'abc123'
      click_button 'Sign up'
      expect(current_path).to eq '/'
    end
  end
end
