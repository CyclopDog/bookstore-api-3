class User < ApplicationRecord
  has_many :books
  before_save { self.username = username.downcase }
  VALID_USERNAME_REGEX = /\A[a-z\d]+\z/i
  validates :username,  
            presence: true, 
            length: { minimum: 5, maximum: 12 }, 
            format: { with: VALID_USERNAME_REGEX }, 
            uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
