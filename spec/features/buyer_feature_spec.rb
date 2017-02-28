require 'rails_helper'

feature 'Buyer can sign in and out' do

  context "Buyer signed in on the homepage" do
    before do
        visit('/')
        click_link('Buyer Sign Up')
        fill_in 'Name', with: 'Mike'
        fill_in 'Email', with: 'mike@test.com'
        fill_in 'Password', with: 'abc123'
        fill_in 'Password confirmation', with: 'abc123'
        click_button('Sign up')
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
