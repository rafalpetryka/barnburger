class Change < ActiveRecord::Migration
  def up
    change_column :burgers, :price, 'integer USING CAST(price AS integer)'
  end
end
