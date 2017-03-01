class Transaction < ApplicationRecord
  belongs_to :seller
  belongs_to :buyer
  belongs_to :offer
end
