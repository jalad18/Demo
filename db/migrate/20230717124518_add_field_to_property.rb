class AddFieldToProperty < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :name, :string
  end
end
