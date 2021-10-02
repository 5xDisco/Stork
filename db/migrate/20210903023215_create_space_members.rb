class CreateSpaceMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :space_members do |t|
      t.references :space, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
