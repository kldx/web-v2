class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :quantity
      t.decimal :price, precision: 8, scale: 2
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
