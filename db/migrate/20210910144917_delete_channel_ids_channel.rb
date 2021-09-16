class DeleteChannelIdsChannel < ActiveRecord::Migration[6.1]
  def change
    remove_column :channels, :channel_ids
  end
end
