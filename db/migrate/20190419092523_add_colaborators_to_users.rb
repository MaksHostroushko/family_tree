class AddColaboratorsToUsers < ActiveRecord::Migration[5.2]
  def change
     add_column :users, :collaborators, :string, array: true, default: []
  end
end
