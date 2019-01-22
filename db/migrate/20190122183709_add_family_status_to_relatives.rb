class AddFamilyStatusToRelatives < ActiveRecord::Migration[5.2]
  def change
    add_column :relatives, :family_status, :string
  end
end
