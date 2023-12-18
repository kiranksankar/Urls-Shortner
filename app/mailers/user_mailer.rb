class UserMailer < ApplicationMailer
  # default from: 'ksgeckolyst@gmail.com'

  def confirmation_email(user)
    @user = user
    mail(to: @user.email, subject: 'Confirm your email address')
  end

end
