class DropTables < ActiveRecord::Migration[7.0]
  def change
    remove_reference :participants, :room, foreign_key: true
    remove_reference :messages, :room, foreign_key: true
    remove_reference :messages, :user, foreign_key: true
    remove_reference :participants, :user, foreign_key: true
    drop_table :rooms
    drop_table :participants
    drop_table :messages
  end
end
