class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  def configure_permitted_parameters
    if resource_class == Teacher
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, :registration_code, :course, :telephone])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :last_name, :registration_code, :course, :telephone])
    else
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, :cpf, :telephone])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :last_name, :cpf, :telephone])
    end
  end
end
