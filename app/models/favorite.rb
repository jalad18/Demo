class Favorite < ApplicationRecord
    has_many :fav_items, dependent: :destroy
    belongs_to :user
    belongs_to :property

    def add_favorite(favorite)
        current_item = fav_items.find_by(favorite_id: favorite.id)
        if current_item
          current_item.increment(:quantity)
        else
          current_item = fav_items.build(favorite_id: favorite.id)
        end
        current_item
    end
end
