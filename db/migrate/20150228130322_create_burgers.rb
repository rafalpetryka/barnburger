class CreateBurgers < ActiveRecord::Migration
  def change
    create_table :burgers do |t|
      t.string :name
      t.text :composition
      t.text :price
      t.integer :how_many_mark
      t.float :average
      t.timestamps null: false
    end
  end
end
