# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

20.times do |comment|
  Product.create!(name: Faker::Name.name, price: Faker::Number.number(digits: 3), description: 'so cool', size: 40, color: Faker::Color.color_name, gender: 'Male', brand: Faker::Color.color_name, discount: 15, category: 'sports')
end

User.create!(name: 'Vitor', email: 'vgm_rox@hotmail.com', password: 123321)
User.create!(name: 'Tiago', email: 'tiago_lelinski@gmail.com', password: 123321)
