FactoryBot.define do
  factory :project do
    title { Faker::Lorem.word }
    position { Faker::Number.digit }
    user { nil } # association :user
  end
end
