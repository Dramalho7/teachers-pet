class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  respond_to :html, :json
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

   def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    update_attrs = [:email, :name, :avatar, :password, :password_confirmation, :current_password]
    devise_parameter_sanitizer.permit :account_update, keys:  update_attrs
   end

   def after_sign_in_path_for(resource_or_scope)
	  current_teacher
	 end

   include ApplicationHelper

end
