class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController

  protected

  def update_resource(resource, params)
    resource.update_without_current_password(params) #独自のメソッド。 編集する際にpasswordを入力する必要をなくす
  end

  private

  def sign_up_params
    params.require(:registration).permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:registration).permit(:name, :registration, :email, :image)
  end
end