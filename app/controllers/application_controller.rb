class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected 

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name])
  end

  private

    def authenticate
      authenticate_or_request_with_http_token do |token, options|
        @auth_user = User.find_by(auth_token: token)
      end
    end
end
