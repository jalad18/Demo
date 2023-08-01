# frozen_string_literal: true

class DropCar < ActiveRecord::Migration[7.0]
  def change
    remove_reference :line_items, :cart, foreign_key: true
    remove_reference :line_items, :property, foreign_key: true

    drop_table :carts
    drop_table :line_items
  end
end
