# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@brand = Brand.create!(name:"nike")
Brand.create!(name:"addidas")
@category = Category.create!(name:"running")
Category.create!(name:"swimming")

10.times do |comment|
  Product.create!(name: Faker::Name.name,
     price: Faker::Number.number(digits: 3),
      description: 'so cool',
       size: 40,
       color: Faker::Color.color_name,
        gender: 'Male',
         brand: @brand,
         discount: 15,
          category: @category,
           quantity: Faker::Number.number(digits: 2))
end

User.create!(name: 'Vitor', email: 'vgm_rox@hotmail.com', password: 123321)
User.create!(name: 'Tiago', email: 'tiago.lelinski@gmail.com', password: 123321)
