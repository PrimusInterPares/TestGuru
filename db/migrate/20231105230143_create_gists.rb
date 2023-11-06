class CreateGists < ActiveRecord::Migration[7.1]
  def up
    create_table :gists do |t|
      t.references :question, null: false, foreign_key: { to_table: :questions }
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.string :url, null: false

      t.timestamps
    end
  end

  def down
    drop_table :gists, if_exists: true
  end
end
