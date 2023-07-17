class Property < ApplicationRecord
    belongs_to :user
    enum status: {for_sale:0, for_rent:1, sold:2}

    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

end
