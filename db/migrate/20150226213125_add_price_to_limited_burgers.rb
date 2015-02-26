class AddPriceToLimitedBurgers < ActiveRecord::Migration
  def change
    add_column :limited_burgers, :price1, :integer
    add_column :limited_burgers, :price2, :integer
  end
end
