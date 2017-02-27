require 'rails_helper'

RSpec.describe Buyer, type: :model do

   context 'creating a buyer' do
      scenario 'it creates a buyer' do
       @buyer = Buyer.create(name: 'Mike Field-May', email: 'mike@test.com', password: 'mike123')
       p @buyer.name
       expect(Buyer.count).to eq 1
      end
    end

end
