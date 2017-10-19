class Order < ApplicationRecord
  enum status: [:pending_payment, :approved_payment, :rejected_payment, :cancelled]

  belongs_to :user
  belongs_to :item
  has_one :invoice, dependent: :destroy

  after_save :deduct_quantity
  after_create :create_bill
  before_create :build_default_invoice

  def deduct_quantity
    q = self.item.quantity - self.quantity
    self.item.update_attribute(:quantity, q)
  end

  private

    def create_bill
      response = Billplz::PostBill.send(collection_id,
                                        description,
                                        customer_email,customer_fullname,
                                        price_in_cents,callback_url,
                                        redirect_url,due_date)
      self.update_attributes(bill_id: response["id"], due_date_at: due_date)
    end

    def collection_id
      self.item.collection_id
    end

    def description
      "Payment for #{self.item.name}"
    end

    def customer_email
      self.user.email
    end

    def customer_fullname
      self.user.profile.fullname
    end

    def price_in_cents
      self.price*100
    end

    def callback_url
      "#{Settings.site_url}/dashboard/orders/#{self.id}/callback"
    end

    def redirect_url
      "#{Settings.site_url}/dashboard/orders/#{self.id}/webhook"
    end

    def due_date
      5.days.from_now.strftime("%Y-%b-%d")
    end

    def build_default_invoice
      build_invoice
      true
    end
end
