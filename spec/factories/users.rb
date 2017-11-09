FactoryBot.define do
  factory :user do
    callsign { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password 'secret'
    password_confirmation 'secret'
    role 0
  end

  factory :admin, class: User do
    callsign { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password 'secret'
    password_confirmation 'secret'
    role 1
  end
end
