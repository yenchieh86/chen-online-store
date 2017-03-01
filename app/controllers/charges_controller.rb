class ChargesController < ApplicationController

  def new
    unless current_user.orders.where(order_status_id: 1).empty?
      @stripe_btn_data = {
        key: "#{ Rails.configuration.stripe[:publishable_key] }",
        description: "Kim-Store Shooper - #{current_user.username}",
        amount: real_amount(current_user.orders.where(order_status_id: 1).first.order_total)
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
      amount: real_amount(current_user.orders.where(order_status_id: 1).first.order_total),
      description: "Kim-Store Shooper - #{current_user.username}",
      currency: 'usd'
    )
    
    if charge.paid?
      flash[:notice] = "Thank you for shopping, we will place your orders ASAP."
      update_order_status(current_user.orders.where(order_status_id: 1).first)
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
end