class DropTableUsersSpace < ActiveRecord::Migration[6.1]
  def change
    drop_table :users_spaces
  end
end
