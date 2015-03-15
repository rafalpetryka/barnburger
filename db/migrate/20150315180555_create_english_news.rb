class CreateEnglishNews < ActiveRecord::Migration
  def change
    create_table :english_news do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.text :text
      t.datetime :date
      t.string :link
      t.string :name_of_link
      t.text :text_with_link

      t.timestamps null: false
    end
  end
end
