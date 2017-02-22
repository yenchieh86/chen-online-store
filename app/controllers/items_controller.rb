class ItemsController < ApplicationController
  def index
    @items = Item.where(user_id: current_user.id)
  end

  def show
  end

  def new
    @item = Item.new
    @photo = @item.photos.new
  end
  
  def create
    @item = current_user.items.build(item_params)
    authorize @item
    if @item.save
      flash[:notice] = 'Your product is upload.'
      redirect_to user_items_path(current_user)
    else
      flash[:alert] = @item.errors.full_messages
      render :new
    end
  end
  
  def update
    @item = Item.find(params[:id])
    authorize @item
    if @item.update(item_params)
      redirect_to @item
    else 
      render :edit
    end
  end
  
  
  private
  
  def item_params
    params.require(:item).permit(:title, :price, :quantity, :body, photos_attributes: [:image])
  end
end
