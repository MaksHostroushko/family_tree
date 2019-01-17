class CreateRelatives < ActiveRecord::Migration[5.2]
  def change
    create_table :relatives do |t|
      t.string :first_name
      t.string :second_name
      t.string :maiden_name
      t.string :born
      t.text :description
      t.string :image
      t.boolean :published

      t.timestamps
    end
  end
end
