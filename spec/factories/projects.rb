FactoryBot.define do
  factory :project do
    title { Faker::Lorem.word }
    position { Faker::Number.between(from: 1).to_i }
    user { nil } # association :user
  end
end
