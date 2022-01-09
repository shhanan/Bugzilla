class AddAssignedToToBugs < ActiveRecord::Migration[7.0]
  def change
 add_column :bugs, :assign_to, :bigint
  end
end
