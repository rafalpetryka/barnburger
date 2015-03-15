class CreateEnglishBurgers < ActiveRecord::Migration
  def change
    create_table :english_burgers do |t|
      t.string :name
      t.text :composition
      t.integer :price
      t.integer :how_many_mark
      t.float :average
      t.boolean :limited

      t.timestamps null: false
    end
  end
end
