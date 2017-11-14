FactoryBot.define do
  factory :shipping do
    association :order, factory: :order
    status 0
    tracking_number nil
    note nil
    prepare_at { Faker::Time.between(DateTime.now - 1, DateTime.now) }
    ready_at nil
    shipped_at nil
    delivered_at nil
    shipping_type nil
    aasm_state "preparation"
  end
end
