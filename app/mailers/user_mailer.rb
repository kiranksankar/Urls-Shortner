class UserMailer < ApplicationMailer
  # default from: 'ksgeckolyst@gmail.com'

  def confirmation_email(user)
    @user = user
    mail(to: @user.email, subject: 'Confirm your email address')
  end

  def password_reset_email(user,reset_token)
    @user = user
    @reset_code = reset_token
    mail(to: @user.email, subject: 'Password Reset Instructions')
  end

end
