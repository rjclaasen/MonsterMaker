FactoryBot.define do
  factory :monster do
    name { Faker::Games::Pokemon.name }

    trait :with_properties do
      transient do
        properties_count { 2 }
      end

      after(:create) do |monster, evaluator|
        create_list(:property, evaluator.properties_count, monster: monster)
      end
    end
  end
end