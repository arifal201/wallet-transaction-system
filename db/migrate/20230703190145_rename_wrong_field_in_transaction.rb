class RenameWrongFieldInTransaction < ActiveRecord::Migration[7.0]
  def change
    rename_column :transactions, :p_cahnge, :p_change
  end
end
