class CreateCoupons < ActiveRecord::Migration[5.1]
  def change
    create_table :coupons do |t|
      t.references :item,                       foreign_key: true
      t.string :code,                           null: false, default: ""
      t.string :description,                    null: true
      t.date :valid_from,                       null: false
      t.date :valid_until,                      null: true
      t.integer :redemption_limit,              null: false, default: 1
      t.integer :coupon_redemptions_count,      null: false, default: 0
      t.decimal :amount,                        precision: 8, scale: 2

      t.timestamps
    end
    add_index :coupons, :code, unique: true
  end
end
