FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {"亜あア"}
    first_name            {"胃いイ"}
    last_name_kana        {"タツヒコ"}
    first_name_kana       {"ヨシダ"}
    birthday              {Date.today}
  end
end
