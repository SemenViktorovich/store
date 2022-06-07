# frozen_string_literal: true

ActiveAdmin.register Book do
  permit_params :name, :author, :date

  index do
    selectable_column
    column :id
    column :name
    column :author
    column :date
    column :created_at
    column :updated_at
    actions
  end

  filter :name
  filter :author
  filter :date
  filter :created_at

  show do
    attributes_table do
      row :id
      row :name
      row :author
      row :date
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
