FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "password" }

    transient do
      confirmed { true }
    end

    after(:create) do |user, evaluator| 
      user.confirm if evaluator.confirmed
    end
  end
end
