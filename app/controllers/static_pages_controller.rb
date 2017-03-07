class StaticPagesController < ApplicationController
  include ApplicationHelper

  def home
      current_user.last_time_login = Date.today if user_signed_in?
      @categories = Category.all.page params[:page]
      
      respond_to do |format|
        format.html
        format.js
      end
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
  end
  
end