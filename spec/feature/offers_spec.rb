require 'rails_helper'

feature 'offers' do
     before do
       visit('/')
       click_link('Seller Sign Up')
       fill_in 'Name', with: 'Mike the Seller'
       fill_in 'Email', with: 'mike@test.com'
       fill_in 'Password', with: 'abc123'
       fill_in 'Password confirmation', with: 'abc123'
       click_button('Sign up')
     end

    scenario 'creating offers' do
      visit '/offers'
      click_link 'Create Offer'
      fill_in 'Price per coin', with: 10
      fill_in 'Number of coins', with: 2
      click_button 'Create Offer'
      expect(page).to have_content('10')
    end

    scenario 'Buyer can buy coins' do
      @seller = Seller.create(name: 'Mike', email: 'mike@mike.com', password: 'abc123')
      Offer.create(number_of_coins: 1, price_per_coin: 10, status:'Open', seller: @seller)
      visit '/offers'
      click_link 'Buy now'
      expect(page).to have_content "Sold"
    end

end
