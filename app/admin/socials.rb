ActiveAdmin.register Social do
permit_params :social, :of, :title, :body, :image

form title: 'A custom title' do |f|
    inputs 'Details' do
      input :title
      input :body
      input :image, as: :file
    end
    actions
  end

  show do
    attributes_table do
      row :title
      row :body
      row :image do
        div do
          if social.image.present?
            image_tag(social.image.mini.url)
          end
        end
      end
      row :created_at
      row :updated_at
    end
  end

  index do
    column :title
    column :body
    column :image do |social|
      div do
        if social.image.present?
          image_tag(social.image.mini.url)
        end
      end
    end
    actions
  end
end
