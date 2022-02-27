# frozen_string_literal: true

class UserDecorator < ApplicationDecorator
  # delegate_all

  def validate_full_name(current_user)

    "#{current_user.first_name} #{current_user.last_name}" if current_user.first_name.present? || current_user.last_name.present?
  end


end
