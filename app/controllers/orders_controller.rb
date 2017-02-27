class OrdersController < ApplicationController
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
end
