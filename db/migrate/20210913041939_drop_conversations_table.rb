class DropConversationsTable < ActiveRecord::Migration[6.1]
  def change
    remove_reference :conversations, :space, foreign_key: false
    drop_table :conversations
  end
end
