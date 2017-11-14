FactoryBot.define do
  factory :article do
    association :user, factory: :user
    association :category, factory: :category
    title { Faker::Name.name }
    content { Faker::Lorem.paragraphs }
    default_picture { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'media', 'default.png')) }
    status 0
    featured false
    slug { Faker::Internet.slug }
    after(:create) do |article|
      FactoryBot.create(:comment, commentable: article)
    end
  end
end
