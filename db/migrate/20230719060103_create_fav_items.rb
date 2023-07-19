class CreateFavItems < ActiveRecord::Migration[7.0]
  def change
    create_table :fav_items do |t|

      t.timestamps
    end
  end
end
