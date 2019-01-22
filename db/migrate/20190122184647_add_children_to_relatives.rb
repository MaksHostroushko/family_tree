class AddChildrenToRelatives < ActiveRecord::Migration[5.2]
  def change
    add_column :relatives, :children, :string
  end
end
