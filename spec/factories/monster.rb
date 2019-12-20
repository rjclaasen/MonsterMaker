FactoryBot.define do
  factory :monster do
    user
    name { Faker::Games::Pokemon.name }
  end
end