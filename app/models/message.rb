class Message < ApplicationRecord
    belongs_to :user
    
    validates :title, length: { minimum: 10 }
    validates :body, length: { minimum: 50 }
end
