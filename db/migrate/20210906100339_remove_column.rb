class RemoveColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :spaces, :created_by
  end
end
