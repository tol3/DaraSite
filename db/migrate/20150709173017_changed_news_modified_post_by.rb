class ChangedNewsModifiedPostBy < ActiveRecord::Migration
  def self.up
    change_column :news, :post_by, :string
  end
  
  def self.down
    change_column :news, :post_by, :text, :limit=>65535, :default=>nil
  end
end
