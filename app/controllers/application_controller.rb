class ApplicationController < ActionController::Base
    # auhtentication
    before_action :configure_permitted_parameters, if: :devise_controller?
    def after_sign_in_path_for(resource)
        if resource.is_a?(User)
            return "/books"
        end
    end
    attr_accessor :balance
    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :username, :password, :profile_picture, :balance])
        devise_parameter_sanitizer.permit(:account_update, keys: [:email, :username, :password, :current_password, :profile_picture, :balance])
    end
    
end
