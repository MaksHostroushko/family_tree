ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :user, :of, :first_name, :last_name, :maiden_name, :description, :image
#
form title: 'A custom title' do |f|
    inputs 'Details' do
      input :first_name
      input :last_name
      input :maiden_name
      input :description
      # input :published
      # input :categories, as: :check_boxes, collection: Category.all.map { |c| [c.name, c.id] }
      input :image, as: :file#, input_html: { multiple: true }
    end
    actions
  end

  index do
    id_column
    column :first_name
    column :last_name
    column :maiden_name
    column :description
    # column :published
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :first_name
      row :last_name
      row :maiden_name
      row :description
      # row :categories do |product|
        # div do
          # product.categories.each do |c|
            # div do
              # c.name
            # end
          # end
        # end
      # end
      row :image do
        div do
          if user.image.present?
            # user.image.each do |img|
              # div do
                # image_tag(img.url(:thumb))
                image_tag(user.image.small.url)
                # end
              # end
            end
          end
        end
      row :created_at
      row :updated_at
    end
    # active_admin_comments
  end
end
