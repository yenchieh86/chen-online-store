class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  has_many :items
  
  paginates_per 1
end
