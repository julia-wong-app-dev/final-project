class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  
  skip_before_action :verify_authenticity_token, raise: false

  before_action :configure_permitted_parameters, if: :devise_controller?
  
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:employer_or_school, :linkedin_url, :first_name, :last_name])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:employer_or_school, :linkedin_url, :first_name, :last_name])
  end
  
end