class CreateOpeningHours < ActiveRecord::Migration
  def change
    create_table :opening_hours do |t|
      t.string :place
      t.string :monday, array: true
      t.string :tuesday, array: true
      t.string :wednesday, array: true
      t.string :thursday, array: true
      t.string :friday, array: true
      t.string :saturday, array: true
      t.string :sunday, array: true

      t.timestamps null: false
    end
  end
end
