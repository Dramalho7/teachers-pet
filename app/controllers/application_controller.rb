class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar])
   end


  	def after_sign_in_path_for(resource_or_scope)
	 current_teacher
	end
end
