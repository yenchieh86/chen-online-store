class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end

  def show
    @order = Order.find(params[:id])
    @user = User.where(slug: params[:user_id]).first
  end

  def new
  end

  def edit
  end
  
  
  def change_order_status_to_placed
    order = Order.find(params[:id])
    unless current_user.admin?
      flash[:alert] = "You can't change other people's order."
      redirect_to root_path
    else
      if order.update(order_status_id: 3)
        flash[:warning] = "The order status has been changed."
        redirect_to :back
      else
        flasj[:alert] = order.errors.full_messages
        render :back
      end
    end
  end
  
  def change_order_status_to_shipped
    order = Order.find(params[:id])
    unless current_user.admin?
      flash[:alert] = "You can't change other people's order."
      redirect_to root_path
    else
      if order.update(order_status_id: 4)
        flash[:warning] = "The order status has been changed."
        redirect_to :back
      else
        flasj[:alert] = order.errors.full_messages
        render :back
      end
    end
  end
  
  def change_order_status_to_delivered
    order = Order.find(params[:id])
    unless current_user.admin?
      flash[:alert] = "You can't change other people's order."
      redirect_to root_path
    else
      if order.update(order_status_id: 5)
        flash[:warning] = "The order status has been changed."
        redirect_to :back
      else
        flasj[:alert] = order.errors.full_messages
        render :back
      end
    end
  end
  
  def change_order_status_to_received
    order = Order.find(params[:id])
    unless order.user_id === current_user.id || current_user.admin?
      flash[:alert] = "You can't change other people's order."
      redirect_to root_path
    else
      if order.update(order_status_id: 6)
        flash[:notice] = "Thank you. Wish we can see you soon."
        redirect_to current_user
      else
        flasj[:alert] = order.errors.full_messages
        render :back
      end
    end
  end
  
  def unpaid_order
    orders = current_user.orders.where(order_status_id: 1)
    
    unless orders.empty?
      @order = orders[0]
    else
      flash[:alert] = "There's no item in your shopping cart."
      redirect_to root_path
    end
  end
end
