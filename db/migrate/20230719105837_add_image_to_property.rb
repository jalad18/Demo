class AddImageToProperty < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :image, :string
  end
end
