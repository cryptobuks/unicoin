class AddWalletToSellers < ActiveRecord::Migration[5.0]
  def change
    add_column :sellers, :wallet, :integer
  end
end
