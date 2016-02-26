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
