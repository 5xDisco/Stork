class AddChannelIdsChannel < ActiveRecord::Migration[6.1]
  def change
    add_column :channels, :channel_ids, :integer
  end
end
