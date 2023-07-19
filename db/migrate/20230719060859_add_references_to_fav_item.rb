class AddReferencesToFavItem < ActiveRecord::Migration[7.0]
  def change
    add_reference :fav_items, :favorite
    add_reference :fav_items, :property
  end
end
