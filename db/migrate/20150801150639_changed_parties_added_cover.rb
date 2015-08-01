class ChangedPartiesAddedCover < ActiveRecord::Migration
  def self.up
    add_column :parties, :cover, :string
  end
  
  def self.down
    remove_column :parties, :cover
  end
end
