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
  
end
