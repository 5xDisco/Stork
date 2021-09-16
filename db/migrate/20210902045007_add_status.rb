class AddStatus < ActiveRecord::Migration[6.1]
  def change
    add_column :channels, :status, :integer
  end
end
