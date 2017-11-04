class CouponRedemption < ApplicationRecord
  belongs_to :coupon
  belongs_to :user
  belongs_to :order
end
