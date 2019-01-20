class CreateCategoryRelatives < ActiveRecord::Migration[5.2]
  def change
    create_table :category_relatives do |t|
      t.belongs_to :relative, foreign_key: true
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
