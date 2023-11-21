class CreateBadges < ActiveRecord::Migration[7.1]
  def up
    create_table :badges do |t|
      t.string :name, null: false, default: 'Badge'
      t.string :image_url, default: 'https://cdn0.iconfinder.com/data/icons/education-science-2/100/Education__science_2_10-1024.png'
      t.string :rule
      t.string :parameter

      t.timestamps
    end
  end

  def down
    drop_table :badges, if_exists: true
  end
end
