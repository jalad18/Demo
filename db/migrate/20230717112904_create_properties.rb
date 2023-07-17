class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :city
      t.string :country
      t.integer :price
      t.integer :status
      t.integer :year

      t.timestamps
    end
  end
end
