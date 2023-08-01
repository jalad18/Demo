# frozen_string_literal: true

class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites, &:timestamps
  end
end
