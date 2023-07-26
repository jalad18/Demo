class DropTable < ActiveRecord::Migration[7.0]
  def change
    remove_reference :messages, :room, foreign_key: true
    remove_reference :messages, :user, foreign_key: true

    drop_table :messages
  end
end
