class Invoice < ApplicationRecord
  belongs_to :order

  after_create :create_invoice_id

  scope :paid, -> { where(state: "paid")   }
  scope :unpaid, -> { where(state: nil)   }
  scope :due, -> { where(state: "due")   }

  def create_invoice_id
    random = [('a'..'z'), ('A'..'Z'), ('1'..'9')].map { |i| i.to_a }.flatten
    invoice_id = (0...7).map { random[rand(random.length)] }.join
    self.update_attribute(:invoice_id, invoice_id)
  end
end
