class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception
  # for APIs you may want to use :null_session instead
  protect_from_forgery with: :exception
   #call the configured params
   before_action :configure_permitted_parameters, if: :devise_controller?

  #protect the db, while allowing these fields to be updated
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:full_name, :username, :email, :password, :password_confirmation, :remember_me, :avatar)}
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:login, :full_name, :username, :email, :password, :remember_me, :avatar)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :full_name, :email, :password, :password_confirmation, :current_password, :avatar)}
        end

  end
