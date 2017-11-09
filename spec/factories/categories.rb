FactoryBot.define do
  factory :category do
    name { Faker::Name.name }
    slug { Faker::Internet.slug }
  end
end
