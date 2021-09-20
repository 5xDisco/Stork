class DropDirectMessagesTable < ActiveRecord::Migration[6.1]
  def change
    remove_reference :direct_messages, :user, foreign_key: false
    remove_reference :direct_messages, :conversation, foreign_key: false
    drop_table :direct_messages
  end
end
