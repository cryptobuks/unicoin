require 'rails_helper'
require '../helpers/buyer_sign_up_and_in'

feature 'Buyer can sign in and out' do

  context "Buyer signed in on the homepage" do
    before do
      buyer_sign_up_and_in
   end

   it "should see 'sign out' link" do
     expect(page).to have_link('Sign Out')
     expect(current_path).to eq('/offers')
   end

  #  it "should not see a 'sign in' link and a 'sign up' link" do
  #    visit('/offers')
  #    expect(page).not_to have_link('Sign in')
  #    expect(page).not_to have_link('Sign up')
  #  end
 end
end
