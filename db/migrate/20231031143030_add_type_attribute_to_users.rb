class AddTypeAttributeToUsers < ActiveRecord::Migration[7.1]
  def up
    add_column :users, :type, :string, null: false, default: 'User'
    remove_column :users, :admin
    add_index :users, :type
  end

  def down
    add_column :users, :admin, :boolean, null: false, default: false
    remove_column :users, :type
    remove_index :users, :type
  end
end
