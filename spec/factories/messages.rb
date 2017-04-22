FactoryGirl.define do

  factory :message do
    id            "1"
    body           "こんにちは！"
    image          "tokyo.image"
    group_id       "1"
    user_id        "1"
    created_at     "2017-04-19 11:30:39"
    updated_at     "2017-04-19 11:30:40"

  end
end
