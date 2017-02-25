class ControlTargetController < ApplicationController
    def target_product_list
        @user = User.find(params[:id])
        @items = @user.items
    end
    
    def target_wish_list
        @user = User.find(params[:id])
        @wish_lists = WishList.where(user_id: params[:id])
    end
    
    def target_review_list
        @user = User.find(params[:id])
        @reviews = Review.where(user_id: params[:id])
    end
end
