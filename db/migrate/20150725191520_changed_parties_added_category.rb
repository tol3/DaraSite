class ChangedPartiesAddedCategory < ActiveRecord::Migration
  def self.up
    add_column :parties, :category, :string
  end
  
  def self.down
    remove_column :parties, :category
  end
end
