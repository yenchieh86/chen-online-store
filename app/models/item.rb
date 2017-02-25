class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :wish_lists
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos
  has_many :reviews, dependent: :destroy
  
  validates :title, presence: true
  validates :body, presence: true
  
  enum status: [:off_shelf, :on_shelf, :special_offer]
end
