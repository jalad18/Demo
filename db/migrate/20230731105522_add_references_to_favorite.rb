# frozen_string_literal: true

class AddReferencesToFavorite < ActiveRecord::Migration[7.0]
  def change
    add_reference :favorites, :property, null: true, foreign_key: true

    drop_table :fav_items
  end
end
