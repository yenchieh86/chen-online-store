class OrderStatus < ApplicationRecord
    has_many :orders
    
    enum status: [:unpaid, :cancelled, :processing, :shipped, :delivered]
end
