class ApplicationController < ActionController::Base
  before_action :configure_teacher_permitted_parameters, if: :teachers_devise_controller?
  before_action :configure_donator_permitted_parameters, if: :donators_devise_controller?

def teachers_devise_controller?
  params[:controller] =~ /teachers/
end

def donators_devise_controller?
  params[:controller] =~ /donators/
end

#   def configure_permitted_parameters
#     # For additional fields in app/views/devise/registrations/new.html.erb
#     if resource_class == Teacher
#       devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, :registration_code, :course, :telephone])

#     # For additional in app/views/devise/registrations/edit.html.erb
#       devise_parameter_sanitizer.permit(:account_update, keys: [:name, :last_name, :registration_code, :course, :telephone])
#   end
# end
end
