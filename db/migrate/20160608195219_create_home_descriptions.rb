class CreateHomeDescriptions < ActiveRecord::Migration
  def change
    create_table :home_descriptions do |t|
      t.string :polish_title
      t.string :english_title
      t.text :polish_text
      t.text :english_text

      t.timestamps null: false
    end
  end
end
