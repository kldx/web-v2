class Order < ApplicationRecord
  enum status: [:pending_payment, :approved_payment, :rejected_payment, :cancelled]

  belongs_to :user
  belongs_to :item

  after_save :deduct_quantity

  def deduct_quantity
    q = self.item.quantity - self.quantity
    self.item.update_attribute(:quantity, q)
  end
end
