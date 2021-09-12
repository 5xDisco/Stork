class AddUserIdsChannel < ActiveRecord::Migration[6.1]
  def change
    add_column :user_channels, :user_ids, :integer
  end
end
