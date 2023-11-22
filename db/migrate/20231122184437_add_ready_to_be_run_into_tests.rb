class AddReadyToBeRunIntoTests < ActiveRecord::Migration[7.1]
  def up
    add_column :tests, :ready_to_be_run, :boolean, null: false, default: false
  end

  def down
    remove_column :tests, :ready_to_be_run
  end
end
