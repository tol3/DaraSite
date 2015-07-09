class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.string :alt
      t.string :hint
      t.string :file
      t.datetime :updated_at
      t.datetime :created_at
    end
  end

  def self.down
    drop_table :images
  end
end
