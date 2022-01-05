class AddUserAssignedToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :user_assigned, :integer, default: nil
  end
end
