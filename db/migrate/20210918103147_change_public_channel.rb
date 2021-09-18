class ChangePublicChannel < ActiveRecord::Migration[6.1]
  def change
    change_column :channels, :is_public, :integer, :default => 1
  end
end
