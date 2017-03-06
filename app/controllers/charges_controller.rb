class ChargesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    unless current_user.orders.where(order_status_id: 1).empty?
      @stripe_btn_data = {
        key: "#{ Rails.configuration.stripe[:publishable_key] }",
        description: "Kim-Store Shooper - #{current_user.username}",
        amount: real_amount(unpaid_order.order_total)
      }
    else
      flash[:alert] = "There's no product in your cart."
      redirect_to :back
    end
  end
  
  def create
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )
  
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: real_amount(unpaid_order.order_total),
      description: "Kim-Store Shooper - #{current_user.username}",
      currency: 'usd'
    )
    
    if charge.paid?
      update_user_and_item_data
      update_order_status(unpaid_order)
      flash[:notice] = "Thank you for shopping, we will place your orders ASAP."
      redirect_to root_path
    else
      flash[:alert] = "Charge failed to process, please try again or contact owner."
      redirect_to root_path
    end
    
    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_charge_path
  end
  
  private
  
    def real_amount(amount)
      total = (amount * 100).to_i
    end
    
    def update_order_status(order)
      order.update(order_status_id: 2)
    end
    
    def unpaid_order
      order = current_user.orders.where(order_status_id: 1).first
    end
    
    def update_user_and_item_data
      unpaid_order.order_items.each do |order_item|
        item = Item.find(order_item.item_id)
        item.update(total_sold: item.total_sold + order_item.quantity)
      end
      
      current_user.update(
        total_spend: current_user.total_spend + unpaid_order.order_total,
        total_orders: current_user.total_orders + 1
      )
    end
end