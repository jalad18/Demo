# frozen_string_literal: true

class Property < ApplicationRecord
  belongs_to :user
  validates :name, :price, :country, :year, presence: true

  has_many :reviews, dependent: :destroy

  enum status: { Sale: 0, Rent: 1, Sold: 2 }
  has_many_attached :images

  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items
end
