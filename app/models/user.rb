class User < ActiveRecord::Base
  has_many :reviews 
  
  validates :first_name, :last_name,  presence: true 
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates_length_of :password, minimum: 8
  validates :password, :confirmation => true
  has_secure_password

 def self.authenticate_with_credentials (email, password)
    user = User.find_by_email(email.downcase.delete " ")
    if user && user.authenticate(password)
      user
    end
 end

end

