class CreateAssetFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :asset_files do |t|
      t.integer :user_id

      t.timestamps
    end
    add_index :asset_files, :user_id
  end
end
