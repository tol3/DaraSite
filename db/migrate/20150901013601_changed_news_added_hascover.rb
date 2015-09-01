class ChangedNewsAddedHascover < ActiveRecord::Migration
  def self.up
    add_column :news, :hascover, :boolean
  end
  
  def self.down
    remove_column :news, :hascover
  end
end
