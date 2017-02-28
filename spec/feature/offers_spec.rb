feature 'offers' do
    # before do
    #   Offer.create(number_of_coins: 1, price_per_coin: 10, status:'Open')
    # end
    scenario 'creating offers' do
      visit '/offers'
      click_link 'Create Offer'
      fill_in 'Price per coin', with: 10
      fill_in 'Number of coins', with: 2
      click_button 'Create Offer'
      expect(page).to have_content('10')
    end

    # scenario 'Buyer can buy coins' do
    #   visit '/offers'
    #   click_link 'Buy'
    #   expect(page).to "Purchase Confirmed"
    # end

    scenario 'Go to profile page' do
      visit '/offers'
      click_link 'Profile'
      expect(page).to have_content 'Welcome!'
    end

end
