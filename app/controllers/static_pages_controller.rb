class StaticPagesController < ApplicationController

  def home
    current_user.last_time_login = Date.today if user_signed_in?
  end
  
  def help
  end
  
  def contect
  end

end