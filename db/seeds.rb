# Brand.destroy.all
# Category.destroy.all
# Product.destroy.all
# PromoCode.destroy.all
# User.destroy.all

# Users
vitor = User.create!(name: 'Vitor', address: "Brazil", role: 'admin',email: 'vgm_rox@hotmail.com', password: 123321).avatar.attach(io: File.open("#{Rails.root}/app/assets/images/collaborators/CollaboratorVitor.jpg"), filename: 'CollaboratorVitor.jpg')
tiago = User.create!(name: 'Tiago', address: "Brazil", role: 'admin', email: 'tiago.lelinski@gmail.com', password: 123321).avatar.attach(io: File.open("#{Rails.root}/app/assets/images/collaborators/CollaboratorTiago.jpg"), filename: 'CollaboratorTiago.jpg')
User.create!(name: 'TestUser', email: 'test@test.com', password: 123321)

# Brands
nike = Brand.create!(name:"nike")
addidas = Brand.create!(name:"addidas")
puma = Brand.create!(name: "puma")
brands = [nike, addidas, puma]

# Colors
blue = Color.create!(name: "blue")
black = Color.create!(name: "black")
white = Color.create!(name: "white")
red = Color.create!(name: "red")
pink = Color.create!(name: "pink")
purple = Color.create!(name: "purple")
orange = Color.create!(name: "orange")
green = Color.create!(name: "green")
yellow = Color.create!(name: "yellow")
grey = Color.create!(name: "grey")
cyan = Color.create!(name: "cyan")
violet = Color.create!(name: "violet")
brown = Color.create!(name: "brown")
colors = [blue, black, white, red, pink, purple, orange, green, yellow, grey, cyan, violet, brown]

# Sizes
size5 = Size.create!(number: 5)
size5_5 = Size.create!(number: 5.5)
size6 = Size.create!(number: 6)
size6_5 = Size.create!(number: 6.5)
size7 = Size.create!(number: 7)
size7_5 = Size.create!(number: 7.5)
size8 = Size.create!(number: 8)
size8_5 = Size.create!(number: 8.5)
size9 = Size.create!(number: 9)
size9_5 = Size.create!(number: 9.5)
size10 = Size.create!(number: 10)
size10_5 = Size.create!(number: 10.5)
size11 = Size.create!(number: 11)
size11_5 = Size.create!(number: 11.5)
size12 = Size.create!(number: 12)
size12_5 = Size.create!(number: 12.5)
size13 = Size.create!(number: 13)
size13_5 = Size.create!(number: 13.5)
size14 = Size.create!(number: 14)
sizes = [size5, size5_5, size6, size6_5, size7, size7_5, size8, size8_5, size9, size9_5, size10, size10_5, size11, size11_5, size12, size12_5, size13, size13_5, size14]

# Categories
running = Category.create!(name:"running")
casual = Category.create!(name:"casual")
gym = Category.create!(name:"gym")
style = Category.create!(name:"style")
street = Category.create!(name:"street")
category_ids = [running.id, casual.id, gym.id, style.id, street.id]

# Genders
unisex = Gender.create!(name: "Unisex")
male = Gender.create!(name: "Male")
female = Gender.create!(name: "Female")
other = Gender.create!(name: "Other")
genders = [unisex, male, female, other]

# Coupons
promocode1 = PromoCode.create!(title:"RUN10", value: 10)
promocode2 = PromoCode.create!(title:"GYM10", value: 10)
promocode3 = PromoCode.create!(title:"XMAS30", value: 30)
promocode4 = PromoCode.create!(title:"NIKE15", value: 15)
promocode5 = PromoCode.create!(title:"ADDIDAS15", value: 15)

promocode1.category_ids = [running.id]
promocode2.category_ids = [casual.id]
promocode3.category_ids = category_ids
promocode4.brand_ids = [nike.id]
promocode5.brand_ids = [addidas.id]

# Decorations (Home backgrounds)
decoration1 = Decoration.create!(name: "Background1").avatar.attach(io: File.open("#{Rails.root}/app/assets/images/backgrounds/background1.jpeg"), filename: 'background1.jpeg')
decoration2 = Decoration.create!(name: "Background2").avatar.attach(io: File.open("#{Rails.root}/app/assets/images/backgrounds/background2.jpeg"), filename: 'background2.jpeg')
decoration3 = Decoration.create!(name: "Background3").avatar.attach(io: File.open("#{Rails.root}/app/assets/images/backgrounds/background3.png"), filename: 'background3.png')

5.times do
  product = Product.create!(name: "Addidas Classic",
                            price: Faker::Number.number(digits: 3),
                            description: 'Adidas Classic shoes feature a timeless design with superior quality and comfort, available in a variety of styles and colors.',
                            size: sizes.sample,
                            color: black,
                            gender: genders.sample,
                            brand: addidas,
                            discount: (rand(0..40.0) * 2.0).round / 2.0,
                            quantity: Faker::Number.number(digits: 2),
                          )
  product.image1.attach(io: File.open("#{Rails.root}/app/assets/images/addidas_products/addidas1.jpg"), filename: 'addidas1.jpg')
  product.category_ids = category_ids.sample(2)
end

5.times do
  product = Product.create!(name: "Addidas Classic",
                            price: Faker::Number.number(digits: 3),
                            description: 'Adidas Classic shoes feature a timeless design with superior quality and comfort, available in a variety of styles and colors.',
                            size:  sizes.sample,
                            color: blue,
                            gender: genders.sample,
                            brand: addidas,
                            discount: (rand(0..40.0) * 2.0).round / 2.0,
                            quantity: Faker::Number.number(digits: 2),
                          )
  product.image1.attach(io: File.open("#{Rails.root}/app/assets/images/addidas_products/addidas2.jpg"), filename: 'addidas2.jpg')
  product.category_ids = category_ids.sample(2)
end

5.times do
  product = Product.create!(name: "Addidas Classic",
                            price: Faker::Number.number(digits: 3),
                            description: 'Adidas Classic shoes feature a timeless design with superior quality and comfort, available in a variety of styles and colors.',
                            size:  sizes.sample,
                            color: red,
                            gender: genders.sample,
                            brand: addidas,
                            discount: (rand(0..40.0) * 2.0).round / 2.0,
                            quantity: Faker::Number.number(digits: 2),
                          )
  product.image1.attach(io: File.open("#{Rails.root}/app/assets/images/addidas_products/addidas3.jpg"), filename: 'addidas3.jpg')
  product.category_ids = category_ids.sample(2)
end

5.times do
  product = Product.create!(name: "Nike NXS",
                            price: Faker::Number.number(digits: 3),
                            description: 'Nike NXS shoes feature a timeless design with superior quality and comfort, available in a variety of styles and colors.',
                            size:  sizes.sample,
                            color: red,
                            gender: genders.sample,
                            brand: nike,
                            discount: (rand(0..40.0) * 2.0).round / 2.0,
                            quantity: Faker::Number.number(digits: 2),
                          )
  product.image1.attach(io: File.open("#{Rails.root}/app/assets/images/nike_products/nike1.png"), filename: 'nike1.png')
  product.category_ids = category_ids.sample(2)
end

5.times do
  product = Product.create!(name: "Nike Classic",
                            price: Faker::Number.number(digits: 3),
                            description: 'Nike Classic shoes feature a timeless design with superior quality and comfort, available in a variety of styles and colors.',
                            size:  sizes.sample,
                            color: white,
                            gender: genders.sample,
                            brand: nike,
                            discount: (rand(0..40.0) * 2.0).round / 2.0,
                            quantity: Faker::Number.number(digits: 2),
                          )
  product.image1.attach(io: File.open("#{Rails.root}/app/assets/images/nike_products/nike2.png"), filename: 'nike2.png')
  product.category_ids = category_ids.sample(2)
end

5.times do
  product = Product.create!(name: "Nike Classic",
                            price: Faker::Number.number(digits: 3),
                            description: 'Nike Classic shoes feature a timeless design with superior quality and comfort, available in a variety of styles and colors.',
                            size:  sizes.sample,
                            color: black,
                            gender: genders.sample,
                            brand: nike,
                            discount: (rand(0..40.0) * 2.0).round / 2.0,
                            quantity: Faker::Number.number(digits: 2),
                          )
  product.image1.attach(io: File.open("#{Rails.root}/app/assets/images/nike_products/nike3.png"), filename: 'nike3.png')
  product.category_ids = category_ids.sample(2)
end

5.times do
  product = Product.create!(name: "Air Vitor",
                            price: Faker::Number.number(digits: 3),
                            description: 'Nike Classic shoes feature a timeless design with superior quality and comfort, available in a variety of styles and colors.',
                            size:  sizes.sample,
                            color: blue,
                            gender: genders.sample,
                            brand: nike,
                            discount: (rand(0..40.0) * 2.0).round / 2.0,
                            quantity: Faker::Number.number(digits: 2),
                          )
  product.image1.attach(io: File.open("#{Rails.root}/app/assets/images/headline_products/VitorSquare.png"), filename: 'VitorSquare.png')
  product.category_ids = category_ids.sample(2)
end

5.times do
  product = Product.create!(name: "Tiago Max Air",
                            price: Faker::Number.number(digits: 3),
                            description: 'Addidas Classic shoes feature a timeless design with superior quality and comfort, available in a variety of styles and colors.',
                            size:  sizes.sample,
                            color: red,
                            gender: genders.sample,
                            brand: addidas,
                            discount: (rand(0..40.0) * 2.0).round / 2.0,
                            quantity: Faker::Number.number(digits: 2),
                          )
  product.image1.attach(io: File.open("#{Rails.root}/app/assets/images/headline_products/TiagoSquare.png"), filename: 'TiagoSquare.png')
  product.category_ids = category_ids.sample(2)
end

# Iconic Products
iconic_product_1 = Product.create!(name: "Rails",
  price: Faker::Number.number(digits: 3),
  description: 'This shoe is a stylish and comfortable choice with its sleek design and cushioned sole, perfect for any occasion.',
  size: sizes.sample,
  color: red,
  gender: genders.sample,
  brand: brands.sample,
  discount: (rand(0..40.0) * 2.0).round / 2.0,
  quantity: Faker::Number.number(digits: 2)
)
iconic_product_1.image1.attach(io: File.open("#{Rails.root}/app/assets/images/iconics/IconicSquare1.png"), filename: 'IconicSquare1.png')
iconic_product_1.iconicImage.attach(io: File.open("#{Rails.root}/app/assets/images/iconics/railsiconic.png"), filename: 'railsiconic.png')
iconic_product_1.category_ids = category_ids.sample(2)

iconic_product_2 = Product.create!(name: "JavaScript",
  price: Faker::Number.number(digits: 3),
  description: 'This shoe is a stylish and comfortable choice with its sleek design and cushioned sole, perfect for any occasion.',
  size: sizes.sample,
  color: yellow,
  gender: genders.sample,
  brand: brands.sample,
  discount: (rand(0..40.0) * 2.0).round / 2.0,
  quantity: Faker::Number.number(digits: 2)
)
iconic_product_2.image1.attach(io: File.open("#{Rails.root}/app/assets/images/iconics/IconicSquare2.png"), filename: 'IconicSquare2.png')
iconic_product_2.iconicImage.attach(io: File.open("#{Rails.root}/app/assets/images/iconics/javascripticonic.png"), filename: 'javascripticonic.png')
iconic_product_2.category_ids = category_ids.sample(2)

iconic_product_3 = Product.create!(name: "React",
  price: Faker::Number.number(digits: 3),
  description: 'This shoe is a stylish and comfortable choice with its sleek design and cushioned sole, perfect for any occasion.',
  size: sizes.sample,
  color: cyan,
  gender: genders.sample,
  brand: brands.sample,
  discount: (rand(0..40.0) * 2.0).round / 2.0,
  quantity: Faker::Number.number(digits: 2)
)
iconic_product_3.image1.attach(io: File.open("#{Rails.root}/app/assets/images/iconics/IconicSquare3.png"), filename: 'IconicSquare3.png')
iconic_product_3.iconicImage.attach(io: File.open("#{Rails.root}/app/assets/images/iconics/reacticonic.png"), filename: 'reacticonic.png')
iconic_product_3.category_ids = category_ids.sample(2)

# Iconic products (Home page)
iconic_1 = Iconic.create!(product: iconic_product_1)
iconic_2 = Iconic.create!(product: iconic_product_2)
iconic_3 = Iconic.create!(product: iconic_product_3)