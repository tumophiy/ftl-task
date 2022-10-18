# frozen_string_literal: true

FactoryBot.define do
  factory :expense do
    name { Faker::Lorem.word }
    value { Faker::Number.number(digits: 6) }
    description { Faker::Lorem.sentence }
    category { Expense.categories.keys.sample }
    association :user_id

    trait :invalid_expense do
      name {}
      value {}
      description {}
    end
  end
end
