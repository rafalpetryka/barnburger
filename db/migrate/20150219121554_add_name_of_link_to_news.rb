class AddNameOfLinkToNews < ActiveRecord::Migration
  def change
    add_column :news, :name_of_link, :string
  end
end
