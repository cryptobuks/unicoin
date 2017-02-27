class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.integer :number_of_coins
      t.integer :price_per_coin
      t.string :status

      t.timestamps
    end
  end
end
