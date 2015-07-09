class CreateNews < ActiveRecord::Migration
  def self.up
    create_table :news do |t|
      t.string :cover 
      t.string :title 
      t.text :content 
      t.boolean :publish 
      t.integer :categort_id 
      t.datetime :updated_at 
      t.datetime :created_at 
    end
  end
  
  def self.down
    drop_table :news
  end
end
