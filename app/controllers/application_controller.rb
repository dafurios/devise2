class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_account_update_params, if: :devise_controller?
  before_action :configure_sign_up_params, if: :devise_controller?


  private

  def filter_admin!
   authenticate_user!
   redirect_to root_path, alert: "No tienes acceso" unless current_user.admin?
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username, :admin])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :username, :admin])
  end

end
