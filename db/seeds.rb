password = '111111'

user = User.new(
  email: "admin@gmail.com",
  password: password,
  password_confirmation: password,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  username: 'owner',
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

user_num = User.all.count

Category.create!(title: 'Food', body: 'Please put all kind of foods under this category.')
Category.create!(title: 'HarryPotter', body: "Please put any associated with HarryPotter's products under this category.")
Category.create!(title: 'Cat', body: 'Please put all kind of cats under this category.')
Category.create!(title: 'Pokemon', body: 'Please put all kind of Pokemon under this category.')
Category.create!(title: 'StarWars', body: "Please put any associated with StarWars's products under this category.")
Category.create!(title: 'Superhero', body: "Please put any associated with Superhero's products under this category.")
Category.create!(title: 'Educator', body: "Please put any associated with Educator's products under this category.")

def faker_array(num)
  case num
  when 0
    Faker::Food.ingredient
  when 1
    Faker::HarryPotter.character
  when 2
    Faker::Cat.breed
  when 3
    Faker::Pokemon.name
  when 4
    Faker::StarWars.character
  when 5
    Faker::Superhero.name
  when 6
    Faker::Educator.university
  end
end

sellers = User.where(role: 'seller').or(User.where(role: 'admin'))

time = 0

until time > 6
  already_used = Array.new
  
  3.times do
    category = Category.find(time + 1)
    seller = sellers[Random.rand(0..(sellers.count - 1))]
    title_name = faker_array(time)
    
    while already_used.include?(title_name)
      title_name = faker_array(time)
    end
    
    category.items.create!(
      title: title_name,
      body: 'This is a description area for < ' + title_name + ' >',
      user_id: seller.id,
      quantity: Random.rand(1..10),
      price: Faker::Number.decimal(2, 2),
      status: Random.rand(0..2),
      weight: Faker::Number.decimal(2, 2),
      width: Faker::Number.decimal(2, 2),
      height: Faker::Number.decimal(2, 2),
      length: Faker::Number.decimal(2, 2)
    )
    
    already_used.push(title_name)
  end
  
  time += 1
end

item_num = Item.all.count

OrderStatus.create!(title: 'unpaid')
OrderStatus.create!(title: 'processing')
OrderStatus.create!(title: 'Placed')
OrderStatus.create!(title: 'shipped')
OrderStatus.create!(title: 'delivered')
OrderStatus.create!(title: 'finished')

order_status_num = OrderStatus.all.count

width = '8-5/8"'
height = '5-3/8"'
length = '1-5/8"'

Shipping.create!(
  title: 'Standard',
  body: "This class is for (size < " + width + " x " + height + " x " + length + ") and weight < 70 lbs.",
  price: 7.15
)

width_a = '13-5/8"'
height_a = '11-7/8"'
length_a = '3-3/8"'

width_b = '11"'
height_b = '8-1/2"'
length_b = '5-1/2"'

Shipping.create!(
  title: 'Standard',
  body: "This class is for (size < " + width_a + " x " + height_a + " x " + length_a + ") or (size < " + width_b + " x " + height_b + " x " + length_b + ") and weight < 70 lbs.",
  price: 13.60
)

width_a = '23-11/16"'
height_a = '11-3/4"'
length_a = '3"'

width_b = '12"'
height_b = '12"'
length_b = '5-1/2"'

Shipping.create!(
  title: 'Standard',
  body: "This class is for (size < " + width_a + " x " + height_a + " x " + length_a + ") or (size < " + width_b + " x " + height_b + " x " + length_b + ") and weight < 70 lbs.",
  price: 18.85
)

20.times do
  user = User.find(Faker::Number.between(1, user_num))
  item = Item.find(Faker::Number.between(1, item_num))
  
  order = user.orders.create!(
            order_status_id: Faker::Number.between(1, order_status_num),
            tax: 0.08,
            shipping_id: 1
          )
          
  3.times do
    amount = Random.rand(1..5)
    
    order_item = order.order_items.create!(
                    item_id: item.id,
                    quantity: amount,
                    unit_price: item.price,
                    total_price: item.price * amount,
                    weight: item.weight * amount,
                    width: item.width * amount,
                    height: item.height * amount,
                    length: item.length * amount
                  )
    
    order.update(order_total: (order.order_total += order_item.total_price))
  end
  
  unless order.order_status_id != 6
    Review.create!(
      rating: Random.rand(1..5),
      body: Faker::Hipster.sentence,
      user_id: user.id,
      item_id: item.id
    )
  end
end

10.times do
  user = User.find(Random.rand(1..User.all.count))
  item = Item.find(Random.rand(1..Item.all.count))
  
  WishList.create!(
    user_id: user.id,
    item_id: item.id
  )
end