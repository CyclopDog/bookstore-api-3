class User < ApplicationRecord
  has_many :books
  before_save { self.username = username.downcase }
  VALID_USERNAME_REGEX = /\A[a-z\d]+\z/i
  validates :username,  
            presence: true, 
            length: { minimum: 5, maximum: 12 }, 
            uniqueness: { case_sensitive: false }
  validates_format_of :username, with: VALID_USERNAME_REGEX, message: 'is invalid (only letters and digits)'
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
