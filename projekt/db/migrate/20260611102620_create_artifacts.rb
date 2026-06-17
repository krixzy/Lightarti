class CreateArtifacts < ActiveRecord::Migration[8.0]
  def change
    create_table :artifacts do |t|
      t.string :name
      t.string :content_type
      t.bigint :size
      t.references :user, null: false, foreign_key: true
      t.references :folder, null: false, foreign_key: true
      t.string :storage_key
      t.string :checksum

      t.timestamps
    end
  end
end
