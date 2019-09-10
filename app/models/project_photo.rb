class ProjectPhoto < ApplicationRecord
  belongs_to :project
  mount_uploader :photo, PhotoUploader
end
