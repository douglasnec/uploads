class AddAttachmentDocumentToUploads < ActiveRecord::Migration
  def self.up
    change_table :uploads do |t|
      t.attachment :document
    end
  end

  def self.down
    drop_attached_file :uploads, :document
  end
end
