FactoryGirl.define do
  factory :resource do
    name                { Faker::App.name }
    description         { Faker::Company.catch_phrase }
  end
end
