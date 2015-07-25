class CreateParties < ActiveRecord::Migration
  def self.up
    create_table :parties do |t|
      t.string :poster 
      t.string :title 
      t.string :description 
      t.datetime :day 
      t.string :location 
      t.string :party_type 
      t.text :content 
      t.text :party_style 
      t.boolean :publish 
      t.datetime :updated_at 
      t.datetime :created_at 
    end
  end
  
  def self.down
    drop_table :parties
  end
end
