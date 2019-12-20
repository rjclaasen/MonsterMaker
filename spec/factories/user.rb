FactoryBot.define do
  factory :user do
    name { Faker::Name.unique.first_name }
    email { Faker::Internet.unique.email }
    password { "foobar" }
    password_confirmation { "foobar" }
  end
end