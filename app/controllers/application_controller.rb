# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from ActiveRecord::RecordNotFound, with: :notfound

  around_action :switch_locale

  private

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale locale, &action
  end

  def locale_from_url
    locale = params[:locale]
    return locale if I18n.available_locales.map(&:to_s).include?(locale)

    nil
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def notfound(exception)
    logger.warn exception
    render file: 'public/404.html', status: :not_found, layout: false
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:last_name, :first_name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:last_name, :first_name, :email, :password, :current_password, :avatar)
    end
  end
end
