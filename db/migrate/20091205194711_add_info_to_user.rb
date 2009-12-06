class AddInfoToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :email, :string
    add_column :users, :address, :string
  end

  def self.down
    remove_column :users, :address
    remove_column :users, :email
  end
end
