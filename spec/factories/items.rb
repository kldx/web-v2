FactoryBot.define do
  factory :item do
    association :user, factory: :user
    name { Faker::Name.name }
    description { Faker::Lorem.paragraphs }
    default_picture { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'media', 'default.png')) }
    quantity 1
    in_stock {}
    default_price 200.00
    sale_price {}
    featured false
    slug { Faker::Internet.slug }
    page_view 100
    collection_id "7cmmw5ry"
  end
end
