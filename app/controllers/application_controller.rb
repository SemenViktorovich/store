# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from ActiveRecord::RecordNotFound, with: :notfound

  private

  def notfound(exception)
    logger.warn exception
    render file:'public/404.html', status: :not_found, layout: false
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:last_name, :first_name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:last_name, :first_name, :email, :password, :current_password, :avatar)
    end
  end
end
