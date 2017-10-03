# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.create(first_name: "Cernan", last_name: "Bernardo", email: "cernanb@gmail.com", password: "password")

10.times do 
  Household.create(name: Faker::Name.last_name, address: Faker::Address.street_address, monthly_rate: Faker::Number.number(4), user_id: u.id)
end

20.times do
  Meal.create(name: Faker::Food.ingredient)
end
