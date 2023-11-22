class CreateUserBadges < ActiveRecord::Migration[7.1]
  def change
    create_table :user_badges do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.references :badge, null: false, foreign_key: { to_table: :badges }

      t.timestamps
    end
  end
end
