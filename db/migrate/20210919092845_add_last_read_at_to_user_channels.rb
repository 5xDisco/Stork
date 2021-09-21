class AddLastReadAtToUserChannels < ActiveRecord::Migration[6.1]
  def change
    add_column :user_channels, :last_read_at, :datetime
  end
end
