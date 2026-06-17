class CreateFolderPermissions < ActiveRecord::Migration[8.0]
  def change
    create_table :folder_permissions do |t|
      t.references :folder, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :role

      t.timestamps
    end
  end
end
