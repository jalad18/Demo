class Change < ActiveRecord::Migration[7.0]
  def change
    change_column :properties, :price, :decimal, precision: 10, scale: 2
  end
end
