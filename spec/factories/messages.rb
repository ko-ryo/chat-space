FactoryGirl.define do

  factory :message do
    id {Faker::Number.digit}
    body {Faker::Lorem.sentence}
    image {Faker::Avatar.image("my-own-slug", "50x50", "jpg") }
    group_id {Faker::Number.digit}
    user_id {Faker::Number.digit}
    created_at {Faker::Time.backward}
    updated_at {Faker::Time.backward}

  end
end
