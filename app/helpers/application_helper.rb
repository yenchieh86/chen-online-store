module ApplicationHelper

  def full_name(user)
    @fullname = "#{user.first_name} #{user.last_name}"
  end

  def average_rating(target)
    unless target.reviews.count === 0
      n = 0
      target.reviews.each { |review| n += review.rating }
      @avg_gerating = n / (target.reviews.count)
    else
      @avg_gerating = 0
    end
  end
  
  def wish_item(wish)
    @item = Item.find(wish.item_id)
  end
  
  def change_item_status_word(string)
    new_word = Array.new
    
    string.split('_').map{ |word| new_word.push(word.capitalize) }
    new_word.join(' ')
  end
  
  def item_total_sell(item)
    total = 0
    item.order_items.each{ |order_item| total += order_item.quantity }
    total
  end
  
  def all_objects(class_name)
    @objects = class_name.all
  end
  
  def find_all_objects_by_id(ids, class_name)
    @objects = Array.new
    
    ids.each do |id|
      @objects.push(class_name.find(id))
    end
    
    @objects
  end
  
  def all_items_id_sort_by_sold_number(class_name)
    list = Array.new
    
    class_name.all.each do |item|
      sum = item_total_sell(item)
      list.push([item.id, sum])
    end
    
    list = list.sort_by { |t| t[1].to_i }.reverse
    sold_rank = Array.new
    
    list.each do |i|
      sold_rank.push(i[0])
    end
    sold_rank
  end
  
  def all_items_sort_by_created_date(class_name)
    newarrival_list = class_name.all
    newarrival_list = newarrival_list.sort_by { |t| t.created_at.to_i }.reverse
  end
  
  def item_average_rating(item)
    unless item.reviews.count > 0
      total = 0
    else
      total = 0
      item.reviews.each { |review| total += review.rating }
      total = total / item.reviews.count
    end
  end
    
end
