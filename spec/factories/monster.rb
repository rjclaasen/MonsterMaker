FactoryBot.define do
  factory :monster do
    name { Faker::Games::Pokemon.name }

    trait :with_traits do
      transient do
        traits_count { 2 }
      end

      after(:create) do |monster, evaluator|
        create_list(:trait, evaluator.traits_count, monster: monster)
      end
    end
  end
end