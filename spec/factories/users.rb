FactoryGirl.define do
  factory :user do
    first_name          { Faker::App.name }
    last_name           { Faker::App.name }
    email               { Faker::Internet.email }
    role                { 1 }
    status              { 1 }
  end
end
