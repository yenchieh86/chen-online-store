class UsersController < ApplicationController
    before_action :authenticate_user!
    
    def index
      @admin = User.where(role: 'admin')
      @seller = User.where(role: 'seller')
      @standard_user = User.where(role: 'standard')
    end
end
