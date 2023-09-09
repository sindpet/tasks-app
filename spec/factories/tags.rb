FactoryBot.define do
  factory :tag do
    title { Faker::Lorem.word }
    user { nil }
  end
end
