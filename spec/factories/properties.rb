FactoryBot.define do
  factory :property do
    monster { build(:monster) }
    name { Faker::Games::LeagueOfLegends::masteries }
  end
end
