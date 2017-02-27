require 'rails_helper'

RSpec.describe Seller, type: :model do

  context 'creating a user ' do
    scenario 'it creates a user' do
     @seller = Seller.create(name: 'Mike Field-May', email: 'mike@test.com', password: 'mike123')
     p @seller.name
     expect(Seller.count).to eq 1
    end
  end

end
