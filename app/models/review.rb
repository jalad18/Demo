# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :property
  belongs_to :user
  validates :body, presence: true
end
