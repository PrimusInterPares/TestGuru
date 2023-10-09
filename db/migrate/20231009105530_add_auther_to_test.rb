class AddAutherToTest < ActiveRecord::Migration[7.0]
  def change
    add_reference :tests, :author, foreign_key: { to_table: :users }, null: false
  end
end
