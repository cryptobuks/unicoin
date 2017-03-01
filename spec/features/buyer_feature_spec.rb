require 'rails_helper'

feature 'Buyer can sign in and out' do
  before do
    sign_up_buyer
  end

  context "Buyer signed in on the homepage" do

   it "should see 'sign out' link" do
     expect(page).to have_link('Sign Out')
     expect(current_path).to eq('/offers')
   end
 end

 describe 'buyer profile' do
   it "should be able to visit their profile" do
     click_link 'Profile'
     expect(page).to have_content 'Welcome Mike'
   end

   it 'should display buyers transactions' do
     create_offer
     visit '/offers'
     click_link_or_button 'Buy now'
     click_link 'Profile'
     expect(page).to have_content 'Previous Transactions:'
     expect(page).to have_content 'Purchased from: Seller'
     save_and_open_page
   end

 end
end
