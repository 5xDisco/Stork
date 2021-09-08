class CreateSpaces < ActiveRecord::Migration[6.1]
  def change
    create_table :spaces do |t|
      t.string :name
      t.string :icon
      t.integer :created_by

      t.timestamps
    end
  end
end
