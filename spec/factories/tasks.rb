FactoryBot.define do
  factory :task do
    title { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    is_done { Faker::Boolean.boolean }
    file { nil }
    user { nil }
    project { nil }
  end
end
