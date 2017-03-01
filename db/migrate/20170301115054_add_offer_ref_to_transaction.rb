class AddOfferRefToTransaction < ActiveRecord::Migration[5.0]
  def change
    add_reference :transactions, :offer, foreign_key: true
  end
end
