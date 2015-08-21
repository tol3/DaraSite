class CreateAdsenses < ActiveRecord::Migration
  def self.up
    create_table :adsenses do |t|
      t.string :name 
      t.string :link 
      t.string :image 
      t.boolean :index 
      t.boolean :publish 
      t.datetime :updated_at 
      t.datetime :created_at 
    end
  end
  
  def self.down
    drop_table :adsenses
  end
end
