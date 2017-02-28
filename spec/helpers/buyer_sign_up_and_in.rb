require 'rails_helper'

module BuyerHelper

def buyer_sign_up_and_in
  visit('/')
  click_link('Buyer Sign Up')
  fill_in 'Name', with: 'Mike'
  fill_in 'Email', with: 'mike@test.com'
  fill_in 'Password', with: 'abc123'
  fill_in 'Password confirmation', with: 'abc123'
  click_button('Sign up')
end


end
