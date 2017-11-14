FactoryBot.define do
  factory :activity do
    association :user, factory: :user
    title { Faker::Name.name }
    description { Faker::Lorem.paragraphs }
    start_time { Faker::Time.between(DateTime.now - 1, DateTime.now) }
    end_time { Faker::Time.forward(23, :morning) }
    status 1
    default_picture { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'media', 'default.png')) }
    organizer { Faker::Seinfeld.character }
    venue { Faker::University.name }
  end
end
