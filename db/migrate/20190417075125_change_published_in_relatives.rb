class ChangePublishedInRelatives < ActiveRecord::Migration[5.2]
  def change
    change_column :relatives, :published, :boolean, default: true
  end
end
