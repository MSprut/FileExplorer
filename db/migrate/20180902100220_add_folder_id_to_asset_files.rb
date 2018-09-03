class AddFolderIdToAssetFiles < ActiveRecord::Migration[5.1]
  def change
    add_column :asset_files, :folder_id, :integer
    add_index :asset_files, :folder_id
  end
end
