FactoryBot.define do
  factory :invoice do
    association :order, factory: :order
    invoice_id "OKjNnYy"
    state "due"
    paid false
    payment_at nil
  end
end
