class ChangedNewsAddedTeaser < ActiveRecord::Migration
  def self.up
    add_column :news, :teaser, :string
  end
  
  def self.down
    remove_column :news, :teaser
  end
end
