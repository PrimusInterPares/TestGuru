class AddAdminToUserNotNull < ActiveRecord::Migration[7.0]
  def change
    add_column(:users, :admin, :boolean, default: false)
    change_column_null(:users, :admin, false)
  end
end
