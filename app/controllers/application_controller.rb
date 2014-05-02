class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :authenticate_user!

  protect_from_forgery with: :exception

  # Add userName to Devise
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
#added username and about to users model
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
    devise_parameter_sanitizer.for(:sign_up) << :about
  end

 
end
