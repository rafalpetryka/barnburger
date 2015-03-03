class AddRateToLimitedBurgers < ActiveRecord::Migration
  def change
    add_column :limited_burgers, :how_many_mark1, :integer
    add_column :limited_burgers, :average1, :float
    add_column :limited_burgers, :how_many_mark2, :integer
    add_column :limited_burgers, :average2, :float
  end
end
