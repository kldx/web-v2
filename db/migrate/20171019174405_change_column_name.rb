class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    remove_column :shippings, :type
    add_column :shippings, :shipping_type, :integer
  end
end
