FactoryBot.define do
  factory :trait do
    monster { build(:monster) }
    name { Faker::Games::LeagueOfLegends::masteries }
  end
end
