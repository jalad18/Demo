class Property < ApplicationRecord
    belongs_to :user

    has_many :fav_items, dependent: :destroy
    has_many :reviews, dependent: :destroy
    enum status: {Sale:0, Rent:1, Sold:2}
end
