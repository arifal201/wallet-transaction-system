class Transaction < ApplicationRecord
  #validates
  validates :amount, presence: true
  validates :identifier, presence: true
  validates :transaction_type, presence: true
  validates :symbol, presence: true

  #relation
  belongs_to :user

  enum transaction_type: [:credit, :debit]
end
