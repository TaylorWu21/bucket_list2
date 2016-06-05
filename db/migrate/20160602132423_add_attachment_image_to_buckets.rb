class AddAttachmentImageToBuckets < ActiveRecord::Migration
  def self.up
    change_table :buckets do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :buckets, :image
  end
end
