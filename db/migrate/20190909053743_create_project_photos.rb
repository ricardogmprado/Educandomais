class CreateProjectPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :project_photos do |t|
      t.string :photo
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
