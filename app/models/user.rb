class User < ApplicationRecord
     before_save { self.email = email.downcase } 
     has_many :tasks
     validates :username, uniqueness: { case_sensitive: false }, presence: true
     validates :password, presence: true
     VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
     validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }

     # for BCrypt
     has_secure_password
end
