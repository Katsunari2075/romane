class Restaurant < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  belongs_to_active_hash :genre
  belongs_to_active_hash :rating

  with_options presence: true do
    validates :store_name
    validates :genre_id
    validates :rating_id
    validates :description
    validates :image
  end

  with_options numericality: { other_than: 1} do
    validates :genre_id
    validates :rating_id
  end
end
