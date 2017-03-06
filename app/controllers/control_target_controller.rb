class ControlTargetController < ApplicationController
    def target_product_list
        @user = User.find(params[:id])
        @items = @user.items
        @status_in_word = Array.new
    
        @items.each_with_index do |item, index|
          string = Array.new
          item.status.split('_').map{ |word| string.push(word.capitalize) }
          @status_in_word.push(string.join(' '))
        end
    end
    
    def target_wish_list
        @user = User.find(params[:id])
        wish_lists = @user.wish_lists
        @items = Array.new
        wish_lists.each { |wish| @items.push(Item.find(wish.item_id))}
    end
    
    def target_review_list
        @user = User.find(params[:id])
        @reviews = @user.reviews
    end
    
    def target_order_list
        @user = User.find(params[:id])
    end
end
