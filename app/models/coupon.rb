class Coupon < ApplicationRecord
  belongs_to :item
  has_many :coupon_redemptions
end
