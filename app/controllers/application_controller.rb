class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :user_is?

  def user_is?(role)
    @user_roles = current_user.user_roles
    @user_roles.each do |user_role|
      if user_role.role.role_name == role
        return true
      end
    end
    return false
  end

  protected

  def configure_permitted_parameters
      # devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
      # devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

end
