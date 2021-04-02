class User < ApplicationRecord
    
    has_secure_password 
    has_many :expenses, dependent: :destroy
    
    validates :username, presence: true
end
 
