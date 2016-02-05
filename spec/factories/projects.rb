FactoryGirl.define do
  factory :project do
    name                { Faker::App.name }
    description         { Faker::Company.catch_phrase }
    start_date          { Faker::Date.backward(365) }
    end_date_projected  { Faker::Date.backward(60) }
    end_date_actual     { Faker::Date.backward(14) }
    budget              { Faker::Number.decimal(4, 2) }
    cost                { Faker::Number.decimal(4, 2) }
  end
end
