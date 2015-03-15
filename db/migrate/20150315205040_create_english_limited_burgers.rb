class CreateEnglishLimitedBurgers < ActiveRecord::Migration
  def change
    create_table :english_limited_burgers do |t|
      t.datetime :date
      t.date :date_on_website
      t.string :name1
      t.string :name2
      t.string :composition1
      t.string :composition2
      t.integer :price1
      t.integer :price2
      t.integer :how_many_mark1
      t.integer :how_many_mark2
      t.float :average1
      t.float :average2

      t.timestamps null: false
    end
  end
end
