# frozen_string_literal: true

Rails.application.routes.draw do
  scope "(:locale)"   do
    devise_for :admin_users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)
    devise_for :users
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    resources :books do
      resources :comments
    end

    root 'books#index'
  end
end

