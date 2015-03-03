class AddLimitedFieldToBurger < ActiveRecord::Migration
  def change
    add_column :burgers, :limited, :boolean
  end
end
