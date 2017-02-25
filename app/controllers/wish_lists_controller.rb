class WishListsController < ApplicationController

  def create
    wish_list = current_user.wish_lists.create(item_id: params[:item_id])
    if wish_list.save
      flash[:notice] = "You saved a wish!"
      redirect_to :back
    else
      flash[:alert] = wish_list.errors.full_messages
      render :back
    end
  end
end
