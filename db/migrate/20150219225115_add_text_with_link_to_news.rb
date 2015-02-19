class AddTextWithLinkToNews < ActiveRecord::Migration
  def change
    add_column :news, :text_with_link, :text
  end
end
