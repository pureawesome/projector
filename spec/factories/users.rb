FactoryGirl.define do
  factory :user do
    name                  { Faker::App.name }
    email                 { Faker::Internet.email }
    role                  1
    status                1
    password              'new!!password'
    password_confirmation {|a| a.password}
  end
end
