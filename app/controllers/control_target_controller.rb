class ControlTargetController < ApplicationController
    def target_product_list
        @user = User.find(params[:id])
        @items = @user.items
    end
    
    def target_wish_list
        @user = User.find(params[:id])
        @wish_lists = @user.wish_lists
    end
    
    def target_review_list
        @user = User.find(params[:id])
        @reviews = @user.reviews
    end
    
    def target_order_list
        @user = User.find(params[:id])
    end
end
