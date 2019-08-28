# frozen_string_literal: true

class Teachers::RegistrationsController < Devise::RegistrationsController
  before_action :sign_up_params, only: [:create]
  before_action :account_update_params, only: [:update]

  private

  def sign_up_params_teachers
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :last_name, :email, :password, :password_confirmation, :registration_code, :course, :telephone])
  end

  def account_update_params_teachers
    devise_parameter_sanitizer.permit(:account_update, keys:[:name, :last_name, :email, :password, :password_confirmation, :registration_code, :course, :telephone])
  end
end
