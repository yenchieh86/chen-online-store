class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable
         
  before_save :capitalize_name
         
  extend FriendlyId
  friendly_id :username, use: :slugged
  
  enum role: [:standard, :seller, :admin]
  
  has_many :items, dependent: :destroy
  has_many :reviews
  has_many :wish_lists, dependent: :destroy
  has_many :orders
  has_many :order_items, through: :orders
  has_many :messages
  
  private
  
    def capitalize_name
      self.first_name = first_name.capitalize
      self.last_name = last_name.capitalize
    end
  
end
