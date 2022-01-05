class RemoveProjectidFromProjects < ActiveRecord::Migration[7.0]
  def change
    remove_column :projects, :projectid
  end
end
