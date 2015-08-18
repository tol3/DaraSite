class CreateFacebookUsers < ActiveRecord::Migration
  def self.up
    create_table :facebook_users do |t|
      t.string :email 
      t.string :password 
      t.string :oauth_token 
      t.string :uid 
      t.string :name 
      t.datetime :updated_at 
      t.datetime :created_at 
    end
  end
  
  def self.down
    drop_table :facebook_users
  end
end
