class AddImagesToRelatives < ActiveRecord::Migration[5.2]
  def change
    add_column :relatives, :images, :json
  end
end
