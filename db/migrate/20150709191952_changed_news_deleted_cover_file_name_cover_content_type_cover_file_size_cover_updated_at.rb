class ChangedNewsDeletedCoverFileNameCoverContentTypeCoverFileSizeCoverUpdatedAt < ActiveRecord::Migration
  def self.up
    remove_column :news, :cover_file_name
    remove_column :news, :cover_content_type
    remove_column :news, :cover_file_size
    remove_column :news, :cover_updated_at
  end
  
  def self.down
    add_column :news, :cover_file_name, :string, :limit=>255, :default=>nil
    add_column :news, :cover_content_type, :string, :limit=>255, :default=>nil
    add_column :news, :cover_file_size, :integer, :limit=>4, :default=>nil
    add_column :news, :cover_updated_at, :datetime, :limit=>nil, :default=>nil
  end
end
