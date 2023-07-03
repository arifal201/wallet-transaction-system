class ChangeTypeColumnTomuch < ActiveRecord::Migration[7.0]
  def change
    change_column(:transactions, :open, :decimal)
    change_column(:transactions, :day_high, :decimal)
    change_column(:transactions, :day_low, :decimal)
    change_column(:transactions, :last_price, :decimal)
    change_column(:transactions, :previous_close, :decimal)
    change_column(:transactions, :p_change, :decimal)
    change_column(:transactions, :year_high, :decimal)
    change_column(:transactions, :year_low, :decimal)
  end
end
