# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Project.destroy_all

100.times do
  Project.create(
    name: Faker::App.name,
    description: Faker::Company.catch_phrase,
    start_date: Faker::Date.backward(265),
    end_date_projected: Faker::Date.backward(60),
    end_date_actual: Faker::Date.backward(14),
    budget: Faker::Number.decimal(4,2),
    cost: Faker::Number.decimal(4,2)
  )
end

User.destroy_all

User.create(
  name: 'Admin',
  email: 'gennaro.the.younger@gmail.com',
  role: 1,
  status: 1,
  password: 'pass',
  password_confirmation: 'pass',
)

100.times do
  User.create(
    name: Faker::App.name,
    email: Faker::Internet.email,
    role: 1,
    status: 1,
    password: 'new!!password',
    password_confirmation: 'new!!password',
  )
end

Task.destroy_all

1000.times do
  Task.create(
    name: Faker::App.name,
    description: Faker::Company.catch_phrase,
    start_date: Faker::Date.backward(265),
    due_date: Faker::Date.backward(60),
    status: 1,
    user_id: User.order("RANDOM()").first.id,
    project_id: Project.order("RANDOM()").first.id
  )
end
