class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable
         
  extend FriendlyId
  friendly_id :username, use: :slugged
  
  enum role: [:standard, :seller, :admin]
  
  has_many :items, dependent: :destroy
  
end
