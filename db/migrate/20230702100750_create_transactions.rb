class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :type, null: false
      t.decimal :amount, null: false
      t.string :symbol
      t.string :identifier, null: false
      t.decimal :open, precision: 19, scale: 16
      t.decimal :day_high, precision: 19, scale: 16
      t.decimal :day_low, precision: 19, scale: 16
      t.decimal :last_price, precision: 19, scale: 16
      t.decimal :previous_close, precision: 19, scale: 16
      t.decimal :change, precision: 19, scale: 16
      t.decimal :p_cahnge, precision: 19, scale: 16
      t.decimal :year_high, precision: 19, scale: 16
      t.decimal :year_low, precision: 19, scale: 16
      t.decimal :total_traded_volume, precision: 19, scale: 16
      t.decimal :total_traded_value, precision: 19, scale: 16
      t.string :last_update_time
      t.decimal :per_change_365d
      t.decimal :per_change_30d

      t.timestamps
    end
  end
end
