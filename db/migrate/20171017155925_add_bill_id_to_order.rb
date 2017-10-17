class AddBillIdToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :bill_id, :string
    add_index :orders, :bill_id, unique: true
  end
end
