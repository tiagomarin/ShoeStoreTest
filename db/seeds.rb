# Brand.destroy.all
# Category.destroy.all
# Product.destroy.all
# PromoCode.destroy.all
# User.destroy.all

brand1 = Brand.create!(name:"nike")
brand2 = Brand.create!(name:"addidas")
brands = [brand1, brand2]

@category1 = Category.create!(name:"running")
@category2 = Category.create!(name:"swimming")
@category3 = Category.create!(name:"style")
@category4 = Category.create!(name:"street")
category_ids = [@category1.id, @category2.id, @category3.id, @category4.id]

promocode1 = PromoCode.create!(title:"RUN10", value: 10)
promocode2 = PromoCode.create!(title:"SWIM10", value: 10)
promocode3 = PromoCode.create!(title:"XMAS30", value: 30)
promocode4 = PromoCode.create!(title:"ADDIDAS15", value: 15)

promocode1.category_ids = [@category1.id]
promocode2.category_ids = [@category2.id]
promocode3.category_ids = [@category1.id, @category2.id]
promocode4.brand_ids = [brand2.id]

10.times do
  product = Product.create!(name: Faker::Name.name,
                            price: Faker::Number.number(digits: 3),
                            description: 'so cool',
                            size: (rand(5..14) * 2.0).round / 2.0,
                            color: Faker::Color.color_name,
                            gender: 'Male',
                            brand: brands.sample,
                            discount: (rand(0..40.0) * 2.0).round / 2.0,
                            quantity: Faker::Number.number(digits: 2)
                          )
  product.category_ids = category_ids.sample(2)
end

vitorProduct = Product.create!(name: "Vitor",
                               price: Faker::Number.number(digits: 3),
                               description: 'so cool',
                               size: (rand(5..14) * 2.0).round / 2.0,
                               color: Faker::Color.color_name,
                               gender: 'Male',
                               brand: brands.sample,
                               discount: (rand(0..40.0) * 2.0).round / 2.0,
                               quantity: Faker::Number.number(digits: 2)
)
vitorProduct.category_ids = category_ids.sample(2)

tiagoProduct = Product.create!(name: "Air Tiago",
                               price: Faker::Number.number(digits: 3),
                               description: 'so cool',
                               size: (rand(5..14) * 2.0).round / 2.0,
                               color: Faker::Color.color_name,
                               gender: 'Male',
                               brand: brands.sample,
                               discount: (rand(0..40.0) * 2.0).round / 2.0,
                               quantity: Faker::Number.number(digits: 2)
)
tiagoProduct.category_ids = category_ids.sample(2)

User.create!(name: 'Vitor', email: 'vgm_rox@hotmail.com', password: 123321)
User.create!(name: 'Tiago', email: 'tiago.lelinski@gmail.com', password: 123321)
