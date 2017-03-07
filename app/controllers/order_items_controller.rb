class OrderItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :delete]
  
  def index
  end

  def show
  end

  def create
    if current_user.orders.where(order_status_id: 1).empty?
      unpaid_order = current_user.orders.create(order_status_id: 1, tax: 0.08, shipping_id: 1)
    else
      unpaid_order = current_user.orders.where(order_status_id: 1).first
    end
    
    item = Item.where(slug: params[:item_id]).first
    order_item = item.order_items.new
    order_item.order_id = unpaid_order.id
    order_item.unit_price = item.price
    order_item.quantity = params[:order_item][:quantity]
    order_item.total_price = item.price * order_item.quantity
    order_item.weight = item.weight * order_item.quantity
    order_item.width = item.width * order_item.quantity
    order_item.height = item.height * order_item.quantity
    order_item.length = item.length * order_item.quantity
    
    
    if order_item.save
      
      if unpaid_order.update(
          item_total: unpaid_order.item_total + order_item.total_price,
          item_total_quantity: unpaid_order.item_total_quantity + order_item.quantity,
          total_weight: unpaid_order.total_weight + order_item.weight,
          total_width: unpaid_order.total_width + order_item.width,
          total_height: unpaid_order.total_height + order_item.height,
          total_length: unpaid_order.total_length + order_item.length
        )
        
        unpaid_order.update(order_total: unpaid_order.item_total * (1 + unpaid_order.tax))
        flash[:notice] = 'The product is in your shopping cart now.'
        redirect_to current_user
      else
        flash[:alert] = unpaid_order.errors.full_messages
        render :back
      end
    else
      flash[:alert] = order_item.errors.full_messages
      render :back
    end
  end

  def edit
    @order_item = OrderItem.find(params[:id])
  end
  
  def update
    @order_item = OrderItem.find(params[:id])
    
    unless current_user.admin? || current_user.id === @order_item.order.user.id
      flash[:alert] = "You can't delete other people's order."
      redirect_to root_path
    else
      item_quantity = @order_item.quantity
      
      if @order_item.update(
          quantity: params[:order_item][:quantity],
          total_price: @order_item.unit_price * params[:order_item][:quantity].to_i
        )
        
        order = @order_item.order
        diff = item_quantity - @order_item.quantity
        
        if order.update(
            item_total: order.item_total - (diff * @order_item.unit_price),
            item_total_quantity: order.item_total_quantity - diff,
            total_weight: order.total_weight - (@order_item.item.weight * diff),
            total_width: order.total_width - (@order_item.item.width * diff),
            total_height: order.total_height - (@order_item.item.height * diff),
            total_length: order.total_length - (@order_item.item.length * diff)
          )
          
          order.update(
            order_total: order.item_total * (1 + order.tax)
          )
          flash[:warning] = 'Your have change your order'
          redirect_to user_order_path(current_user, @order_item.order)
        else
          flash[:alert] = order.errors.full_messages
          render :back
        end
      else
        flash[:alert] = @order_item.errors.full_messages
        render user_order_path(current_user, @order_item.order)
      end
    end  
  end
  
  
  
  
  
  
  def destroy
    @order_item = OrderItem.find(params[:id])
    
    unless current_user.admin? || current_user.id === @order_item.order.user.id
      flash[:alert] = "You can't delete other people's order."
      redirect_to root_path
    else
      if @order_item.destroy
        order = @order_item.order
        
        if order.update(
            total_length: order.total_length - @order_item.length,
            total_height: order.total_height - @order_item.height,
            total_width: order.total_width - @order_item.width,
            total_weight: order.total_weight - @order_item.weight,
            item_total_quantity: order.item_total_quantity - @order_item.quantity,
            item_total: order.item_total - @order_item.total_price
          )
            
            order.update(order_total: order.item_total * (1 + order.tax))
        
            flash[:warning] = 'Your have canceled your order'
            redirect_to user_order_path(current_user, @order_item.order)
        else
          flash[:alert] = order.errors.full_messages
          render :back
        end
      else
        flash[:alert] = @order_item.errors.full_messages
        render user_order_path(current_user, @order_item.order)
      end
    end
  end
  
  private
  
    def order_item_params
      params.require(:order_item).permit(:item_id, :quantity)
    end
    
    
end
