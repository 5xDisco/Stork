class AddReferenceToConversation < ActiveRecord::Migration[6.1]
  def change
    add_reference :conversations, :space, foreign_key: true
  end
end
