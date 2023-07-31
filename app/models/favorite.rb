class Favorite < ApplicationRecord
    has_many :fav_items, dependent: :destroy
    belongs_to :user
    belongs_to :property
end
