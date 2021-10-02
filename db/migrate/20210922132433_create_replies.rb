class CreateReplies < ActiveRecord::Migration[6.1]
  def change
    create_table :replies do |t|
      t.references :message, null: false, foreign_key: true

      t.timestamps
    end
  end
end
