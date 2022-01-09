class AddDescriptionToBugs < ActiveRecord::Migration[7.0]
  def change
  add_column :bugs, :description, :text
  end
end
