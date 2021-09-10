class ChangeSpaceMembersTableName < ActiveRecord::Migration[6.1]
  def change
    rename_table('space_members', 'users_spaces')
  end
end
