class Bug < ApplicationRecord
  belongs_to :project
validates_uniqueness_of :title, scope: :project_id
end
