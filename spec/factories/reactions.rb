FactoryBot.define do
  factory :reaction do
    monster { build(:monster) }
    name { Faker::Games::Pokemon::move }
  end
end
