class AddCreatorRefToBugs < ActiveRecord::Migration[7.0]
  def change
      add_column :bugs, :creator_id, :bigint , index: true
  add_foreign_key :bugs, :users, column: :creator_id
  end
end
