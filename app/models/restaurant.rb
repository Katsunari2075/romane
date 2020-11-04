class Restaurant < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many_attached :images, dependent: :destroy
  belongs_to_active_hash :genre
  belongs_to_active_hash :rating

  with_options presence: true do
    validates :store_name
    validates :genre_id
    validates :rating_id
    validates :description
    validates :images
  end

  with_options numericality: { other_than: 1} do
    validates :genre_id
    validates :rating_id
  end

  
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
