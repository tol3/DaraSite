class ChangedNewsAddedVideo < ActiveRecord::Migration
  def self.up
    add_column :news, :video, :boolean
  end
  
  def self.down
    remove_column :news, :video
  end
end
