class ChangeDateOnWebsiteInLimitedBurger < ActiveRecord::Migration
  def self.up
  	change_column :limited_burgers, :date_on_website, 'date USING CAST(date_on_website AS date)'
  end
  	change_column :limited_burgers, :date_on_website, :string
  def self.down

  end
end
