ActiveAdmin.register User do
  permit_params :first_name, :last_name, :role, :email, :password, :password_confirmation

  index do
    selectable_column
    column :id
    column :email
    column :created_at
    column :updated_at
    column :first_name
    column :last_name
    column :role
    actions
  end

  filter :first_name
  filter :last_name
  filter :created_at
  filter :updated_at

  show do
    attributes_table do
      row :id
      row :email
      row :created_at
      row :updated_at
      row :first_name
      row :last_name
      row :role
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
