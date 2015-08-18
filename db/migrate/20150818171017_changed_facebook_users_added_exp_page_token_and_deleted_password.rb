class ChangedFacebookUsersAddedExpPageTokenAndDeletedPassword < ActiveRecord::Migration
  def self.up
    add_column :facebook_users, :exp, :datetime
    add_column :facebook_users, :page_token, :string
    remove_column :facebook_users, :password
  end
  
  def self.down
    add_column :facebook_users, :password, :string, :limit=>255, :default=>nil
    remove_column :facebook_users, :exp
    remove_column :facebook_users, :page_token
  end
end
