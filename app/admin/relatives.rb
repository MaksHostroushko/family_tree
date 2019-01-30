ActiveAdmin.register Relative do
  permit_params :relative, :of, :user, :first_name, :second_name, :maiden_name, :description, :born, :family_status, :children, :published, images:[], category_ids: []
  #
  form title: 'A custom title' do |f|
      inputs 'Details' do
        input :user
        input :first_name
        input :second_name
        input :maiden_name
        input :description, as: :html_editor
        input :born
        input :family_status
        input :children
        input :published
        input :categories, as: :check_boxes, collection: Category.all.map { |c| [c.name, c.id] }
        input :images, as: :file, input_html: { multiple: true }
      end
      actions
    end

    index do
      id_column
      column :user
      column :first_name
      column :second_name
      column :maiden_name
      column :description
      column :born
      column :family_status
      column :children
      column :published
      column :created_at
      column :updated_at
      actions
    end

    show do
      attributes_table do
        row :user
        row :first_name
        row :second_name
        row :maiden_name
        row :description
        row :born
        row :family_status
        row :children
        row :published
        row :categories do |relative|
          div do
            relative.categories.each do |c|
              div do
                c.name
              end
            end
          end
        end
        row :images do
          div do
            if relative.images.present?
              relative.images.each do |img|
                div do
                  image_tag(img.url(:thumb))
                  # image_tag(relative.image.small.url)
                  end
                end
              end
            end
          end
        row :created_at
        row :updated_at
      end
      # active_admin_comments
  end
end
