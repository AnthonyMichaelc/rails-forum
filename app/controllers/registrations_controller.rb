class RegistrationController < Devise::RegistrationsController
  private
  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def account_updte_params
    params.require(:user).permit(:username, :email, :password, :password_confirmationm, :current_password)
  end
end
