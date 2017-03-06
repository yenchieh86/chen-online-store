class ReviewsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @review = Review.new
    @item = Item.find(params[:item_id])
  end
  
  def create
    item = Item.find(params[:item_id])
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.item_id = item.id
    
    if @review.save
      item.total_rating += @revire.rating
      item.total_reviews += 1
      item.average_rating = (item.total_rating.to_f / item.total_reviews).round(2)
      if item.save
        flash[:notice] = 'Thank you for your review.'
        redirect_to root_path
      else
        flash[:alert] = item.errors.full_messages
        render :back
      end
    else
      flash[:alert] = @review.errors.full_messages
      render :back
    end
  end
  
  private
  
    def review_params
      params.require(:review).permit(:rating, :body)
    end
end
