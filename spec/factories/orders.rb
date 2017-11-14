FactoryBot.define do
  factory :order do
    association :user, factory: :user
    association :item, factory: :item
    quantity 2
    price 440
    status 0
    bill_id nil
    due_date_at { Faker::Time.between(DateTime.now - 1, DateTime.now) }
    after(:create) do |order|
      FactoryBot.create(:invoice, order: order)
    end
  end
end
