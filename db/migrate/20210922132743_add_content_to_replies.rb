class AddContentToReplies < ActiveRecord::Migration[6.1]
  def change
    add_column :replies, :content, :string
  end
end
