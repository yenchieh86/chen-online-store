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
