# frozen_string_literal: true

class DropCart < ActiveRecord::Migration[7.0]
  def change
    remove_reference :carts, :user, foreign_key: true
    remove_reference :carts, :property, foreign_key: true

    drop_table :carts
  end
end
