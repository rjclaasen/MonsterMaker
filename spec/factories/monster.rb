FactoryBot.define do
  factory :monster do
    name { Faker::Games::Pokemon.name }
  end
end