class ChangedNewsAddedCategoryIdPostByPostDateAndDeletedCategortId < ActiveRecord::Migration
  def self.up
    add_column :news, :category_id, :integer
    add_column :news, :post_by, :text
    add_column :news, :post_date, :date
    remove_column :news, :categort_id
    add_index :news, :category_id
  end
  
  def self.down
    add_column :news, :categort_id, :integer, :limit=>4, :default=>nil
    remove_column :news, :category_id
    remove_column :news, :post_by
    remove_column :news, :post_date
  end
end
