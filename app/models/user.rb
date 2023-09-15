class User < ApplicationRecord
    has_secure_password

    validates :username, :email, presence:true, uniqueness:true 
    validates :user_type, inclusion:{in: %w(Artist Listener)}
    
end
