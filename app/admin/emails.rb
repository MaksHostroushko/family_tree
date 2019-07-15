ActiveAdmin.register Email do
  permit_params :email, :of, :body
end
