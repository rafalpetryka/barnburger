class CreateLimitedBurgers < ActiveRecord::Migration
  def change
    create_table :limited_burgers do |t|
      t.datetime :date
      t.string :date_on_website
      t.string :name1
      t.string :name2
      t.text :composition1
      t.text :composition2

      t.timestamps null: false
    end
  end
end
