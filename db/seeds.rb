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

OrderStatus.create!(title: 'unpaid')
OrderStatus.create!(title: 'processing')
OrderStatus.create!(title: 'Placed')
OrderStatus.create!(title: 'shipped')
OrderStatus.create!(title: 'delivered')
OrderStatus.create!(title: 'finished')

Category.create!(title: 'Food', body: 'This Category is for all kinds of food.')
Category.create!(title: 'Book', body: 'This Category is for all kinds of books.')

category = Category.first

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


5.times do
  user = User.find(Faker::Number.between(1, 11))
  item = Item.find(Faker::Number.between(1, 12))
  amount = Faker::Number.between(1, 6)
  orderstatus = OrderStatus.find(Faker::Number.between(1, 6))
  order = user.orders.create(order_status_id: orderstatus.id, tax: Faker::Number.decimal(3, 2), shipping: Faker::Number.decimal(3, 2))
  order_item = order.order_items.create(item_id: item.id, unit_price: item.price, quantity: amount, total_price: amount * item.price)
  order.item_total = order_item.quantity
  order.order_total = order.item_total + order.shipping + order.tax
  order.save
end