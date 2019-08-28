class Teacher::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:name, :last_name, :registration_code, :course, :telephone])
  end
end
