class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user
    set_flash_message(:notice, :success, kind: "Facebook")
  end

  def failure
    redirect_to root_path
  end
end