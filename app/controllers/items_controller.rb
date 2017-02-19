class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    
    if @item.save
      flash[:notice] = 'Your product is upload.'
      redirect_to root_path
    else
      flash[:alert] = @item.errors.full_messages
      render 'new'
    end
  end
  
  
  private
  
  def item_params
    params.require(:item).permit(:title, :price, :quantity, :body)
  end
end
