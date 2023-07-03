class ChangeColumnType < ActiveRecord::Migration[7.0]
  def change
    change_column(:transactions, :change, :decimal)
  end
end
