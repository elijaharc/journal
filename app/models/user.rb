class User < ApplicationRecord
  has_many :categories, :dependent => :destroy
  has_many :tasks, through: :categories
  validates :username, presence: true
  validates :username, uniqueness: true, if: -> { self.username.present? } 
  ORDER_CATEGORY_OPTIONS = [
    ['Alphabetical (Ascending)', 'category_name asc'], ['Alphabetical (Descending)', 'category_name desc'],
    ['First Created', 'created_at asc'], ['Last Created', 'created_at desc'], ['Last Edited', 'updated_at desc']
]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
end
