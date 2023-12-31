# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    @exception_message = exception.message
    render 'layouts/_illegal_access'
  end
  # before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    render
  end

  # protected

  # def configure_permitted_parameters
  #     devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation, :role])
  # end
end
