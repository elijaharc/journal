class ApplicationController < ActionController::Base
    before_action :set_locale
    before_action :update_allowed_parameters, if: :devise_controller?

    def set_locale
      if user_signed_in?
        I18n.locale = current_user.language
      end
    end
  
    protected
  
    def update_allowed_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :first_name, :last_name, :email, :language, :password, :password_confirmation)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :first_name, :last_name, :email, :language, :password, :current_password)}
    end
end
