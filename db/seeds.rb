
@brand = Brand.create!(name:"nike")
Brand.create!(name:"addidas")
@category = Category.create!(name:"running")
Category.create!(name:"swimming")

10.times do |comment|
  Product.create!(name: Faker::Name.name,
                  price: Faker::Number.number(digits: 3),
                  description: 'so cool',
                  size: rand(5..14),
                  color: Faker::Color.color_name,
                  gender: 'Male',
                  brand: @brand,
                  discount: 15,
                  category: @category,
                  quantity: Faker::Number.number(digits: 2))
end

User.create!(name: 'Vitor', email: 'vgm_rox@hotmail.com', password: 123321)
User.create!(name: 'Tiago', email: 'tiago.lelinski@gmail.com', password: 123321)
