class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_paramaters, if: :devise_controller?
  
  def after_sign_in_path_for(user)
    user_path(user)
  end
  
  protected
  
    def configure_permitted_paramaters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation) }
    end
end
