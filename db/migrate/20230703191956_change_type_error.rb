class ChangeTypeError < ActiveRecord::Migration[7.0]
  def up
    change_column(:transactions, :total_traded_value, :decimal)
    change_column(:transactions, :total_traded_volume, :decimal)
  end

  def down
    change_column(:transactions, :total_traded_value, :decimal, precision: 19, scale: 16)
    change_column(:transactions, :total_traded_volume, :decimal, precision: 19, scale: 16)
  end
end
