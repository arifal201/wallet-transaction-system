class Wallet < ApplicationRecord
  belongs_to :user

  def add_money(amount)
    update(balance: balance + BigDecimal(amount))
  end

  def subtract_money(amount)
    big_amount = BigDecimal(amount)
    if (self.balance - big_amount).positive?
      update(balance: balance - big_amount)
    else
      errors.add(:balance, 'wallet is not enough')
    end
  end
end
