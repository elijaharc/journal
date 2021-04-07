class User < ApplicationRecord
  has_many :categories, :dependent => :destroy
  has_many :tasks, through: :categories
  validates :username, :first_name, :last_name, presence: true
  validates :username, uniqueness: true 
  validates :first_name, length: { maximum: 20 }
  validates_confirmation_of :password
  ORDER_CATEGORY_OPTIONS = [
    ['Alphabetical (Ascending)', 'category_name asc'], ['Alphabetical (Descending)', 'category_name desc'],
    ['First Created', 'created_at asc'], ['Last Created', 'created_at desc'], ['Last Edited', 'updated_at desc']
  ].freeze
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
end
