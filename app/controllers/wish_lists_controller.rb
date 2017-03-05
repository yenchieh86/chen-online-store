class WishListsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  
  def create
    item = Item.where(slug: params[:item_id]).first
    wish_list = current_user.wish_lists.create(item_id: item.id)
    if wish_list.save
      flash[:notice] = "You saved a wish!"
      redirect_to :back
    else
      flash[:alert] = wish_list.errors.full_messages
      render :back
    end
  end
end
