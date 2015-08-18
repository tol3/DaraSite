class ChangedNewsAddedPostFacebook < ActiveRecord::Migration
  def self.up
    add_column :news, :post_facebook, :boolean
  end
  
  def self.down
    remove_column :news, :post_facebook
  end
end
