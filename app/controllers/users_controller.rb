class UsersController < ApplicationController
    def index
        @admin = User.where(role: 'admin')
        @seller = User.where(role: 'seller')
        @standard_user = User.where(role: 'standard')
    end
    
end
