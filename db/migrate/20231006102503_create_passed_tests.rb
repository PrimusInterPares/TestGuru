class CreatePassedTests < ActiveRecord::Migration[7.0]
  def change
    create_table :passed_tests do |t|
      t.integer :user_id, foreign_key: true
      t.integer :test_id, foreign_key: true
      t.float :score
      t.date :date

      t.timestamps
    end
  end
end
