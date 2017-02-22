class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos
  
  validates :title, presence: true
  validates :body, presence: true
  
  
end
