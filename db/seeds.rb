# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Booking.destroy_all
Task.destroy_all
Resource.destroy_all
Project.destroy_all
User.destroy_all

100.times do
  Project.create(
    name: Faker::App.name,
    description: Faker::Lorem.paragraph(2),
    start_date: Faker::Date.backward(265),
    end_date_projected: Faker::Date.forward(60),
    end_date_actual: Faker::Date.forward(365),
    budget: Faker::Number.decimal(4,2),
    cost: Faker::Number.decimal(4,2)
  )
end

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
    role: rand(2),
    status: rand(2),
    password: 'new!!password',
    password_confirmation: 'new!!password',
  )
end

1000.times do
  Task.create(
    name: Faker::App.name,
    description: Faker::Company.catch_phrase,
    start_date: Faker::Date.backward(30),
    due_date: Faker::Date.forward(60),
    status: rand(2),
    user_id: User.order("RANDOM()").first.id,
    project_id: Project.order("RANDOM()").first.id
  )
end

30.times do
  Resource.create(
    name: Faker::App.name,
    description: Faker::Lorem.paragraph(2)
  )
end


300.times do
  Booking.create(
  project_id: Project.order("RANDOM()").first.id,
  resource_id: Resource.order("RANDOM()").first.id,
  start_datetime: Faker::Time.forward(30),
  end_datetime: Faker::Time.forward(60)
  )
end
