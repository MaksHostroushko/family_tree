class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :maiden_name
      t.text :description
      t.string :picture
      t.boolean :published

      t.timestamps
    end
  end
end
