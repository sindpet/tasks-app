FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(min_length: 6)

    email { Faker::Internet.email }
    password { password }
    password_confirmation { password }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end
end
