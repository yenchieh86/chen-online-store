class Order < ApplicationRecord
  belongs_to :user
  belongs_to :order_status
  belongs_to :shipping
  has_many :order_items
  
  scope :order_status, -> { order(order_status_id: :ASC) }
end
