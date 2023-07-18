class Property < ApplicationRecord
    belongs_to :user
    enum status: {for_sale:0, for_rent:1, sold:2}

end
