class Profile < ApplicationRecord
  belongs_to :user, optional: true

  with_options presence: true do
    validates :favorite_food
    validates :profile
  end
end
