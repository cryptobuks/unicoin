class AddPhoneNumberToSellers < ActiveRecord::Migration[5.0]
    def change
      add_column :sellers, :phone_number, :string
    end
end
