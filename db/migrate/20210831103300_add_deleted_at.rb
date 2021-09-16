class AddDeletedAt < ActiveRecord::Migration[6.1]
  def change
    add_column :channels, :deleted_at, :datetime
    add_index :channels, :deleted_at
  end
end
