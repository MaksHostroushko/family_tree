class AddImageToSocials < ActiveRecord::Migration[5.2]
  def change
    add_column :socials, :image, :string
  end
end
