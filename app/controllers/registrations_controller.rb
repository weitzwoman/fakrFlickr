class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, :only => [:create]

protected

  def sign_up_params
    devise_parameter_sanitizer.for(:user) { |u| u.permit(:email, :password) }
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :avatar)
  end
end
