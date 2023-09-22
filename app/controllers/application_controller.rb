# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # auhtentication
  before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
    return unless resource.is_a?(User)
    '/books'
  end
  attr_accessor :balance

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email username password profile_picture balance])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[email username password current_password profile_picture balance])
  end
end
