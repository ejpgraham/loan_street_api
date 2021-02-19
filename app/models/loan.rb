class Loan < ApplicationRecord
  validates :amount, presence: true
  validates :monthly_payment_amount, presence: true
  validates :length, presence: true
  validates :interest, presence: true
  validates :api_key, presence: true
  # TODO Add api_key validation - check that it's a key we issued.
end
