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
  
end
