require 'rails_helper'

def sign_up_buyer
  visit('/')
  click_link('Buyer Sign Up')
  fill_in 'Name', with: 'Mike'
  fill_in 'Email', with: 'mike@test.com'
  fill_in 'Password', with: 'abc123'
  fill_in 'Password confirmation', with: 'abc123'
  click_button('Sign up')
end

def create_offer
  @seller = Seller.create(name: 'Seller', email: 'seller@test.com', password: 'abc123')
  Offer.create(number_of_coins: 1, price_per_coin: 10, status:'Open', seller: @seller)
end
