class ApplicationController < ActionController::Base
    # auhtentication
    
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :username, :password, :profile_picture])
        devise_parameter_sanitizer.permit(:account_update, keys: [:email, :username, :password, :current_password, :profile_picture])
    end
    
end
