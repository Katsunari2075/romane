class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :restaurants
  has_many :likes
  has_many :like_restaurants, through: :likes, source: :restaurant
  has_many :comments
  has_one :profile

  validates :name, presence: true
end
