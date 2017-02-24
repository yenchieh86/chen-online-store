class ControlTargetController < ApplicationController
    def target_product_list
        @user = User.find(params[:id])
        @items = @user.items
    end
end
