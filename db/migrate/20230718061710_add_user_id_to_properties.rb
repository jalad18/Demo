# frozen_string_literal: true

class AddUserIdToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :user_id, :integer
  end
end
