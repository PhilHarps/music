class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :listings, :type, :instrument_type
  end
end