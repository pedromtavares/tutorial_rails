class AddUserToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :user, :int
  end

  def self.down
    remove_column :orders, :user
  end
end
