class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :movies
  has_many :reviews, dependent: :destroy
  
  validates :email, presence: true
  validates :password, presence: true
  validates :email, uniqueness: true, on: :create
  validates :password, length: { in: 6..15 }
end
