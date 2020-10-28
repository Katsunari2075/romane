class Restaurant < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :store_name
    validates :genre_id
    validates :rating_id
    validates :description
    validates :image
  end
end
