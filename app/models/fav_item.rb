class FavItem < ApplicationRecord
    belongs_to :property
    belongs_to :favorite
end
