require 'donators/parameter_sanitizer'
require 'teachers/parameter_sanitizer'
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # def after_sign_in_path_for(teacher)
  #   if teacher.registration_code.nil?
  #     edit_teacher_registration_path
  #   else
  #     new_project_path
  #   end
  # end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    if resource_class == Donator
      Donator::ParameterSanitizer.new(Donator, :donator, @params)
    else
      Teacher::ParameterSanitizer.new(Teacher, :teacher, @params)
    end
  end
end

#   def configure_permitted_parameters
#     # For additional fields in app/views/devise/registrations/new.html.erb
#     if resource_class == Teacher
#       devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, :registration_code, :course, :telephone])

#     # For additional in app/views/devise/registrations/edit.html.erb
#       devise_parameter_sanitizer.permit(:account_update, keys: [:name, :last_name, :registration_code, :course, :telephone])
#   end
# end
