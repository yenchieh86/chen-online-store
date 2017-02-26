password = '111111'

user = User.new(
    email: "admin@gmail.com",
    password: password,
    password_confirmation: password,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.user_name,
    birthday: Faker::Date.backward(14),
    role: 'admin'
  )
  
  user.skip_confirmation!
  user.save

5.times do
  user = User.new(
    email: Faker::Internet.free_email,
    password: password,
    password_confirmation: password,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.user_name,
    birthday: Faker::Date.backward(14),
    role: 'standard'
  )
  
  user.skip_confirmation!
  user.save

  seller = User.new(
    email: Faker::Internet.free_email,
    password: password,
    password_confirmation: password,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.user_name,
    birthday: Faker::Date.backward(14),
    role: 'seller'
  )
  
  seller.skip_confirmation!
  seller.save
end



Category.create!(title: 'Food', body: 'This Category is for all kinds of food.')

category = Category.last

2.times do 
  Item.create!(
    title: Faker::Food.ingredient,
    body: "This attribute is for food's description.",
    user_id: Faker::Number.between(7, 10),
    quantity: Faker::Number.number(2),
    category_id: category.id,
    price: Faker::Number.decimal(3, 2),
    status: 'off_shelf'
  )
  
  WishList.create!(user_id: Faker::Number.between(7, 10), item_id: Item.last.id)
  
  Review.create!(
    rating: Faker::Number.between(1, 5),
    body: Faker::Hipster.sentence,
    user_id: Faker::Number.between(7, 10),
    item_id: Item.last.id
  )
  
  Item.create!(
    title: Faker::Food.ingredient,
    body: "This attribute is for food's description.",
    user_id: Faker::Number.between(7, 10),
    quantity: Faker::Number.number(2),
    category_id: category.id,
    price: Faker::Number.decimal(3, 2),
    status: 'on_shelf'
  )
  
  WishList.create!(user_id: Faker::Number.between(7, 10), item_id: Item.last.id)
  
  Review.create!(
    rating: Faker::Number.between(1, 5),
    body: Faker::Hipster.sentence,
    user_id: Faker::Number.between(7, 10),
    item_id: Item.last.id
  )
  
  Item.create!(
    title: Faker::Food.ingredient,
    body: "This attribute is for food's description.",
    user_id: Faker::Number.between(7, 10),
    quantity: Faker::Number.number(2),
    category_id: category.id,
    price: Faker::Number.decimal(3, 2),
    status: 'special_offer'
  )
  
  WishList.create!(user_id: Faker::Number.between(7, 10), item_id: Item.last.id)
  
  Review.create!(
    rating: Faker::Number.between(1, 5),
    body: Faker::Hipster.sentence,
    user_id: Faker::Number.between(7, 10),
    item_id: Item.last.id
  )
end

Category.create!(title: 'Book', body: 'This Category is for all kinds of books.')

category = Category.last

2.times do 
  Item.create!(
    title: Faker::Book.title,
    body: "This attribute is for books's description.",
    user_id: Faker::Number.between(7, 10),
    quantity: Faker::Number.number(2),
    category_id: category.id,
    price: Faker::Number.decimal(3, 2),
    status: 'off_shelf'
  )
  
  WishList.create!(user_id: Faker::Number.between(7, 10), item_id: Item.last.id)
  
  Review.create!(
    rating: Faker::Number.between(1, 5),
    body: Faker::Hipster.sentence,
    user_id: Faker::Number.between(7, 10),
    item_id: Item.last.id
  )
  
  Item.create!(
    title: Faker::Book.title,
    body: "This attribute is for book's description.",
    user_id: Faker::Number.between(7, 10),
    quantity: Faker::Number.number(2),
    category_id: category.id,
    price: Faker::Number.decimal(3, 2),
    status: 'on_shelf'
  )
  
  WishList.create!(user_id: Faker::Number.between(7, 10), item_id: Item.last.id)
  
  Review.create!(
    rating: Faker::Number.between(1, 5),
    body: Faker::Hipster.sentence,
    user_id: Faker::Number.between(7, 10),
    item_id: Item.last.id
  )
  
  Item.create!(
    title: Faker::Book.title,
    body: "This attribute is for book's description.",
    user_id: Faker::Number.between(7, 10),
    quantity: Faker::Number.number(2),
    category_id: category.id,
    price: Faker::Number.decimal(3, 2),
    status: 'special_offer'
  )
  
  WishList.create!(user_id: Faker::Number.between(7, 10), item_id: Item.last.id)
  
  Review.create!(
    rating: Faker::Number.between(1, 5),
    body: Faker::Hipster.sentence,
    user_id: Faker::Number.between(7, 10),
    item_id: Item.last.id
  )
end