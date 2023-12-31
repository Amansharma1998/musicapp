class User < ApplicationRecord
    has_secure_password
    
    validates :username, :email, presence:true, uniqueness:true 
    validates :user_type, inclusion:{in: %w(Artist Listener)}
    
    def generate_password_token!
        self.reset_password_token = generate_token
        self.reset_password_sent_ats = Time.now.utc
        save!
    end
    
    def password_token_valid?
        (self.reset_password_sent_ats + 4.hours) > Time.now.utc
    end
    
    def reset_password!(password)
        self.reset_password_token = nil
        self.password = password
        save!
    end
    
    private
    
    def generate_token
        SecureRandom.hex(10)
    end
    
end
