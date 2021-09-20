class CreateInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :invitations do |t|
      t.integer :status, default: 0
      t.references :user, null: false, foreign_key: true
      t.references :space, null: false, foreign_key: true
      t.references :channel, null: false, foreign_key: true
      t.string :invite_email

      t.timestamps
    end
  end
end
