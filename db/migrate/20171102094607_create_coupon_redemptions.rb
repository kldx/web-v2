class CreateCouponRedemptions < ActiveRecord::Migration[5.1]
  def change
    create_table :coupon_redemptions do |t|
      t.references :coupon, foreign_key: true
      t.references :user, foreign_key: true
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
