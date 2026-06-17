class AddOriginalFilenameToArtifacts < ActiveRecord::Migration[8.0]
  def change
    add_column :artifacts, :original_filename, :string
  end
end
