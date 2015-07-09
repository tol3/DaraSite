class AddAttachmentCoverToNews < ActiveRecord::Migration
  def self.up
    change_table :news do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :news, :cover
  end
end
