ActiveAdmin.register Page, as: "Footer_pages" do
  permit_params :page, :of, :title, :body, :slug

  form title: 'A custom title' do |f|
      inputs 'Details' do
        input :title
        input :body, as: :html_editor
        input :slug
      end
      actions
    end

  controller do
    def find_resource
      begin
        scoped_collection.where(slug: params[:id]).first!
      rescue ActiveRecord::RecordNotFound
        scoped_collection.find(params[:id])
      end
    end
  end
end
