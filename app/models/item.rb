class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :wish_list
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos
  has_many :reviews, dependent: :destroy
  
  validates :title, presence: true
  validates :body, presence: true
  
  
end
