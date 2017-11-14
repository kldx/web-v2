FactoryBot.define do
  factory :banner do
    association :user, factory: :user
    title { Faker::Name.name }
    default_picture { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'media', 'default.png')) }
    status 0
    sort 1
    slug { Faker::Internet.slug }
  end
end
