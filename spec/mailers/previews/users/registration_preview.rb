# Preview all emails at http://localhost:3000/rails/mailers/users/registration
class Users::RegistrationPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/users/registration/send_credentials
  def send_credentials
    user = User.new email: 'you@testnest.co', password: 'F0qiVTGM2jAiXANX'
    Users::RegistrationMailer.send_credentials(user)
  end

end
