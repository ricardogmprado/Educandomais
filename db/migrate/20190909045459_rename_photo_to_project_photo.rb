class RenamePhotoToProjectPhoto < ActiveRecord::Migration[5.2]
  def change
    rename_table :photos, :project_photos
  end
end
