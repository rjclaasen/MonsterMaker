FactoryBot.define do
  factory :action do
    monster { build(:monster) }
    name { Faker::Games::Pokemon::move }
  end
end
