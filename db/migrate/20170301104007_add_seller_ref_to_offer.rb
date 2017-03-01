class AddSellerRefToOffer < ActiveRecord::Migration[5.0]
  def change
    add_reference :offers, :seller, foreign_key: true
  end
end
