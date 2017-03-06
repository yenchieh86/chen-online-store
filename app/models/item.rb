class Item < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  validates :title, presence: true
  validates :body, presence: true
  
  belongs_to :user
  belongs_to :category
  has_many :reviews, dependent: :destroy
  has_many :order_items
  has_many :wish_lists
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, reject_if: :all_blank, allow_destroy: true
  
  scope :top_sale, -> { order(total_sold: :DESC)}
  scope :new_arrived, -> { order(created_at: :DESC)}
  
  enum status: [:off_shelf, :on_shelf, :special_offer]
  
  include PgSearch
  pg_search_scope :search_by_title, :against => :title
end
