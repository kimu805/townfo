class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_group
  before_action :basic_auth

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :profile])
  end

  def current_group
    @current_group ||= current_user.groups.first
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == "admin" && password == "2222"
    end
  end
end
