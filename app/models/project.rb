class Project < ApplicationRecord
  has_many :users
  has_many :bugs,dependent: :destroy
  has_many :project_users,dependent: :destroy
end
