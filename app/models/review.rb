class Review < ApplicationRecord
  belongs_to :property
  validates :name, presence: true
end
