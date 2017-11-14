FactoryBot.define do
  factory :comment do
    association :user, factory: :user
    association :commentable, factory: :article
    body { Faker::Lorem.paragraphs }
  end
end
