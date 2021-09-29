class AddSlugToSpaces < ActiveRecord::Migration[6.1]
  def change
    add_column :spaces, :slug, :string
    add_index :spaces, :slug, unique: true
  end
end
