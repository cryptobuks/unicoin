require 'rails_helper'

feature "Transactions" do

  before do
    @seller = Seller.create(name: 'Mike', email: 'mike@mike.com', password: 'abc123')
    Offer.create(number_of_coins: 1, price_per_coin: 10, status:'Open', seller: @seller)
    visit('/')
    click_link('Buyer Sign Up')
    fill_in 'Name', with: 'Jack'
    fill_in 'Email', with: 'jack@test.com'
    fill_in 'Password', with: 'abc123'
    fill_in 'Password confirmation', with: 'abc123'
    click_button('Sign up')
    visit ('/offers')
    click_link 'Buy now'
  end

  scenario "A buyer buys a new offer, and is given a transaction receipt" do
    expect(current_path).to eq('/offers')
    @offer = Offer.first
    expect(@offer.status).to eq 'Sold'
    expect(Transaction.count).to eq 1
  end

  scenario "it contains information about the transaction; " do
    @trans = Transaction.first
    expect(@trans.seller.name).to eq 'Mike'
    expect(@trans.buyer.name).to eq 'Jack'
    expect(@trans.offer).to eq Offer.first
  end
end
