class AddSpaceIdChannel < ActiveRecord::Migration[6.1]
  def change
    add_reference :channels, :space, foreign_key: true
    add_column :channels, :is_public, :integer
    remove_column :channels, :status, :integer
  end
end
