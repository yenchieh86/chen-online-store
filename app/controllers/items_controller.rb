class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :delete]
  
  def index
    @items = policy_scope(Item)
  end

  def show
    @item = Item.friendly.find(params[:id])
  end

  def new
    unless current_user.admin?
      flash[:alert] = 'You are not authorize to do that.'
      redirect_to root_path
    else
      @item = Item.new
      @photo = @item.photos.new
      @categories = Category.all.collect { |c| [c.title, c.id] }
    end
    
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
  
  def edit
    unless current_user.admin?
      flash[:alert] = 'You are not authorize to do that.'
      redirect_to root_path
    else
      @item = Item.find(params[:id])
      @categories = Category.all.collect { |c| [c.id, c.title] }
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
  
  def destroy
    @item = Item.find(params[:id])
    authorize @item
    
    if @item.destroy
      flash[:notice] = "<#{@item.title}> is gone."
      redirect_to :back
    else
      flash[:alert] = item.errors.full_messages
      render :back
    end
  end
  
  private
  
    def item_params
      params.require(:item).permit(:title, :price, :quantity, :body, :category_id, :status, photos_attributes: [:image])
    end
end
