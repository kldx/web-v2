class Invoice < ApplicationRecord
  belongs_to :order

  after_create :create_invoice_id
  after_update :send_noti, if: -> { saved_change_to_state? && state == "paid" && paid == true }

  scope :paid, -> { where(state: "paid")   }
  scope :unpaid, -> { where(state: nil)   }
  scope :due, -> { where(state: "due")   }

  def create_invoice_id
    random = [('a'..'z'), ('A'..'Z'), ('1'..'9')].map { |i| i.to_a }.flatten
    invoice_id = (0...7).map { random[rand(random.length)] }.join
    self.update_attribute(:invoice_id, invoice_id)
  end

  def send_noti
    PaymentMailer.send_noti(self).deliver_now
    PaymentMailer.send_admin_noti(self).deliver_now
  end
end
