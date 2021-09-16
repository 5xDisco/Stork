class CreateUsersSpaces < ActiveRecord::Migration[6.1]
  def change
    create_table :users_spaces do |t|
      t.references :user, null: false, foreign_key: true
      t.references :space, null: false, foreign_key: true

      t.timestamps
    end
  end
end
