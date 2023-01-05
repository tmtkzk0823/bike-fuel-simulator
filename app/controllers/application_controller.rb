class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_action :verify_authenticity_token, if: :devise_controller?
  helper_method :current_user, :user_signed_in?

  include DeviseTokenAuth::Concerns::SetUserByToken

  private

  # アカウント編集に使用
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
