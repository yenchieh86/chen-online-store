class StaticPagesController < ApplicationController
  include ApplicationHelper

  def home
      current_user.last_time_login = Date.today if user_signed_in?
  end
  
  def help
  end
  
  def about
  end
  
  def mostpopular
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end
  
  def mostpopular_items
    @items = Array.new
    all_items_id_sort_by_sold_number(Item).each { |id| @items.push(Item.find(id)) }
    @items
  end
  
  def onsale
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end
  
  def newarrival
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end
  
  def newarrival_items
    @items = all_items_sort_by_created_date(Item)
  end
  
end