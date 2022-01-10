class Bug < ApplicationRecord
  belongs_to :project
  validates_uniqueness_of :descriptive_title, scope: :project_id
  mount_uploader :screenshot, ImageUploader
end
