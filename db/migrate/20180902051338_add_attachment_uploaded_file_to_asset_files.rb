class AddAttachmentUploadedFileToAssetFiles < ActiveRecord::Migration[5.1]
  def self.up
    change_table :asset_files do |t|
      t.attachment :uploaded_file
    end
  end

  def self.down
    remove_attachment :asset_files, :uploaded_file
  end
end
