class Item < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  belongs_to :user
  belongs_to :category
  has_many :wish_lists
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, reject_if: :all_blank, allow_destroy: true
  has_many :reviews, dependent: :destroy
  has_many :order_items
  
  validates :title, presence: true
  validates :body, presence: true
  
  enum status: [:off_shelf, :on_shelf, :special_offer]
  
  include PgSearch
  multisearchable :against => [:title, :body], :using => { :tsearch => {:dictionary => "english"} }
end
