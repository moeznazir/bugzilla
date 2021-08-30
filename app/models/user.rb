class User < ApplicationRecord
    has_many :bugs
    has_secure_password
    
    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "Must be a valid email adress"}
    validates :user_name, presence: true
    validates :user_role, presence:true
end
    