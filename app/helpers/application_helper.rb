module ApplicationHelper

  def full_name(user)
    @fullname = "#{user.first_name} #{user.last_name}"
  end

  def average_rating(item)
    unless item.reviews.count === 0
      n = 0
      item.reviews.each { |review| n += review.rating }
      @avg_gerating = n / (item.reviews.count)
    else
      @avg_gerating = 0
    end
  end
  
end
