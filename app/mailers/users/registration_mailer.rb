class Users::RegistrationMailer < ApplicationMailer

  def send_credentials(user)
    @user = user

    mail to: @user.email
  end
end
