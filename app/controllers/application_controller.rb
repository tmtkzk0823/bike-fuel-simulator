class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token, if: :devise_controller?
  helper_method :current_user, :user_signed_in?

  include DeviseTokenAuth::Concerns::SetUserByToken
end
