class CreateInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :invitations do |t|
      t.integer :status, default: 0
      t.integer :user_id
      t.integer :space_id
      t.integer :channel_id
      t.string :invite_email

      t.timestamps
    end
  end
end
