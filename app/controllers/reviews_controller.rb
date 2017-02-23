class ReviewsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def show
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
      flash[:notice] = 'Thank you for your review.'
      redirect_to root_path
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
