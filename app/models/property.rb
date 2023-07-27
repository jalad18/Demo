class Property < ApplicationRecord
    belongs_to :user

    #Pagination
    #paginates_per 3


    validates :name, :price, :country, :year, presence: true
    has_many :fav_items, dependent: :destroy
    #has_many :favorites, through: :fav_items

    has_many :reviews, dependent: :destroy
    enum status: {Sale:0, Rent:1, Sold:2}
    has_many_attached :images
end
