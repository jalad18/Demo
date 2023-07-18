class Property < ApplicationRecord
    belongs_to :user
    enum status: {Sale:0, Rent:1, Sold:2}

end
