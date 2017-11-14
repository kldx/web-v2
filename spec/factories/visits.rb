FactoryBot.define do
  factory :visit do
    visit_token nil
    visitor_token nil
    ip nil
    user_agent nil
    referrer nil
    landing_page nil
    association :user, factory: :user
    referring_domain nil
    search_keyword nil
    browser nil
    os nil
    device_type nil
    screen_height nil
    screen_width nil
    country nil
    region nil
    city nil
    postal_code nil
    latitude nil
    longitude nil
    utm_source nil
    utm_medium nil
    utm_term nil
    utm_content nil
    utm_campaign nil
    started_at nil
  end
end
