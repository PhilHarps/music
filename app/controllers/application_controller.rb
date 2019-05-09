class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  # sanitize extra fields' data before it hits model
  def configure_permitted_parameters
    # for sign up form
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address, :city, :state, :email, :is_school])

    # for edit profile form
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :address, :city, :state, :email, :is_school])
  end
end
