class RemakeOrders < ActiveRecord::Migration
  def self.up
	remove_column :orders,:name 
	remove_column :orders,:email
	remove_column :orders,:address
  end

  def self.down
  end
end
