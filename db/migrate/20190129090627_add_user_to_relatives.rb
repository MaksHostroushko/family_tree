class AddUserToRelatives < ActiveRecord::Migration[5.2]
  def change
    add_reference :relatives, :user, foreign_key: true
  end
end
