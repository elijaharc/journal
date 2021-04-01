class User < ApplicationRecord
  has_many :categories, :dependent => :destroy
  validates :username, presence: true
  validates :username, uniqueness: true, if: -> { self.username.present? } 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
