# Brand.destroy.all
# Category.destroy.all
# Product.destroy.all
# PromoCode.destroy.all
# User.destroy.all

brand1 = Brand.create!(name:"nike")
brand2 = Brand.create!(name:"addidas")
brand3 = Brand.create!(name: "puma")
brands = [brand1, brand2, brand3]

colors = ["blue", "black", "white", "red", "pink", "purple", "prange", "green", "yellow", "grey", "cyan", "violet", "brown"]

@category1 = Category.create!(name:"running")
@category2 = Category.create!(name:"casual")
@category3 = Category.create!(name:"gym")
@category4 = Category.create!(name:"style")
@category5 = Category.create!(name:"street")
category_ids = [@category1.id, @category2.id, @category3.id, @category4.id, @category5.id]

sizes = [5, 5.5, 6, 6.5, 7, 7.5, 8, 8.5, 9, 9.5, 10, 10.5, 11, 11.5, 12, 12.5, 13, 13.5, 14]

genders = ["male", "female"]

promocode1 = PromoCode.create!(title:"RUN10", value: 10)
promocode2 = PromoCode.create!(title:"GYM10", value: 10)
promocode3 = PromoCode.create!(title:"XMAS30", value: 30)
promocode4 = PromoCode.create!(title:"NIKE15", value: 15)
promocode5 = PromoCode.create!(title:"ADDIDAS15", value: 15)

promocode1.category_ids = [@category1.id]
promocode2.category_ids = [@category2.id]
promocode3.category_ids = category_ids
promocode4.brand_ids = [brand1.id]
promocode5.brand_ids = [brand2.id]

5.times do
  product = Product.create!(name: "Nike Air",
                            price: Faker::Number.number(digits: 3),
                            description: 'so cool',
                            size: sizes.sample,
                            color: "black",
                            gender: genders.sample,
                            brand: brand1,
                            discount: (rand(0..40.0) * 2.0).round / 2.0,
                            quantity: Faker::Number.number(digits: 2),
                          )
  product.images.attach(io: File.open("#{Rails.root}/app/assets/images/YoShoe_black.jpg"), filename: 'YoShoe_black.jpg')
  product.category_ids = category_ids.sample(2)
end

5.times do
  product = Product.create!(name: "Nike Air",
                            price: Faker::Number.number(digits: 3),
                            description: 'so cool',
                            size: sizes.sample,
                            color: "blue",
                            gender: genders.sample,
                            brand: brand1,
                            discount: (rand(0..40.0) * 2.0).round / 2.0,
                            quantity: Faker::Number.number(digits: 2),
                          )
  product.images.attach(io: File.open("#{Rails.root}/app/assets/images/YoShoe_blue.jpg"), filename: 'YoShoe_blue.jpg')
  product.category_ids = category_ids.sample(2)
end

5.times do
  product = Product.create!(name: "Nike Air",
                            price: Faker::Number.number(digits: 3),
                            description: 'so cool',
                            size: sizes.sample,
                            color: "red",
                            gender: genders.sample,
                            brand: brand1,
                            discount: (rand(0..40.0) * 2.0).round / 2.0,
                            quantity: Faker::Number.number(digits: 2),
                          )
  product.images.attach(io: File.open("#{Rails.root}/app/assets/images/YoShoe_red.jpg"), filename: 'YoShoe_red.jpg')
  product.category_ids = category_ids.sample(2)
end

vitorProduct = Product.create!(name: "Air Vitor",
                               price: Faker::Number.number(digits: 3),
                               description: 'so cool',
                               size: sizes.sample,
                               color: colors.sample,
                               gender: 'Male',
                               brand: brands.sample,
                               discount: (rand(0..40.0) * 2.0).round / 2.0,
                               quantity: Faker::Number.number(digits: 2)
)
vitorProduct.images.attach(io: File.open("#{Rails.root}/app/assets/images/iconic3.png"), filename: 'iconic3.png')
vitorProduct.category_ids = category_ids.sample(2)

tiagoProduct = Product.create!(name: "Tiago Jordan",
                               price: Faker::Number.number(digits: 3),
                               description: 'so cool',
                               size: sizes.sample,
                               color: colors.sample,
                               gender: 'Male',
                               brand: brands.sample,
                               discount: (rand(0..40.0) * 2.0).round / 2.0,
                               quantity: Faker::Number.number(digits: 2)
)
tiagoProduct.images.attach(io: File.open("#{Rails.root}/app/assets/images/iconic2.png"), filename: 'iconic2.png')
tiagoProduct.category_ids = category_ids.sample(2)

vitor = User.create!(name: 'Vitor', email: 'vgm_rox@hotmail.com', password: 123321)
vitor.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/iconic2.png"), filename: 'iconic2.png')
tiago = User.create!(name: 'Tiago', email: 'tiago.lelinski@gmail.com', password: 123321)
tiago.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/iconic2.png"), filename: 'iconic2.png')

# Iconic Products

iconic_product_1 = Product.create!(name: "React",
  price: Faker::Number.number(digits: 3),
  description: 'so cool',
  size: sizes.sample,
  color: colors.sample,
  gender: 'Male',
  brand: brands.sample,
  discount: (rand(0..40.0) * 2.0).round / 2.0,
  quantity: Faker::Number.number(digits: 2)
)
iconic_product_1.images.attach(io: File.open("#{Rails.root}/app/assets/images/reacticonicsquare.png"), filename: 'reacticonicsquare.png')
iconic_product_1.images.attach(io: File.open("#{Rails.root}/app/assets/images/reacticonic.png"), filename: 'reacticonic.png')
iconic_product_1.category_ids = category_ids.sample(2)

iconic_product_2 = Product.create!(name: "Rails",
  price: Faker::Number.number(digits: 3),
  description: 'so cool',
  size: sizes.sample,
  color: colors.sample,
  gender: 'Male',
  brand: brands.sample,
  discount: (rand(0..40.0) * 2.0).round / 2.0,
  quantity: Faker::Number.number(digits: 2)
)
iconic_product_2.images.attach(io: File.open("#{Rails.root}/app/assets/images/railsiconicsquare.png"), filename: 'railsiconicsquare.png')
iconic_product_2.images.attach(io: File.open("#{Rails.root}/app/assets/images/railsiconic.png"), filename: 'railsiconic.png')
iconic_product_2.category_ids = category_ids.sample(2)

iconic_product_3 = Product.create!(name: "JavaScript",
  price: Faker::Number.number(digits: 3),
  description: 'so cool',
  size: sizes.sample,
  color: colors.sample,
  gender: 'Male',
  brand: brands.sample,
  discount: (rand(0..40.0) * 2.0).round / 2.0,
  quantity: Faker::Number.number(digits: 2)
)
iconic_product_3.images.attach(io: File.open("#{Rails.root}/app/assets/images/javascripticonicsquare.png"), filename: 'javascripticonicsquare.png')
iconic_product_3.images.attach(io: File.open("#{Rails.root}/app/assets/images/javascripticonic.png"), filename: 'javascripticonic.png')
iconic_product_3.category_ids = category_ids.sample(2)

iconic_1 = Iconic.create!(product: iconic_product_1)
iconic_2 = Iconic.create!(product: iconic_product_2)
iconic_3 = Iconic.create!(product: iconic_product_3)