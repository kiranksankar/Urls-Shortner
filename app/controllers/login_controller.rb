class LoginController < ApplicationController
  def logins

  end

  def edit


  end


  def verifyemail
    email = params[:email]
    puts (email)
    user = User.find_by(email: email)

    $id = user.id
    puts($id)



    if user
      reset_token = user.generate_password_reset_token
      puts("Password reset token: #{reset_token}")


      UserMailer.password_reset_email(user, $global_password_reset_token).deliver_now
      flash[:success] ="Token send to the Email Entered"

      redirect_to "/token_confirm"
    else
      flash[:error] = "Email address not found in our records."
      redirect_to "/forgotpassword"
    end
  end



  def tocken_confirm


  end

  def confirmtoken
    user = User.find_by(id: $id)

    puts(user.email)

    token = params[:token]
    puts(token)
    if token == $global_password_reset_token
      flash[:tocken] = "tocken confirmed"

      redirect_to password_path(id: user.id)
    else
      flash[:error] = "invalid tocken"

      redirect_to "/token_confirm"
    end
  end


  def password

  end


  def password_reset

    password = params[:newpassword]
    confirm_password = params[:confirmpassword]
    id = $id
    user = User.find_by(id: id)
    # user = User.find_by(id: id)

    puts("*****************************************")
    puts(user.email)
    puts(password)
    puts(confirm_password)

    if password == confirm_password

      user.update(password: password)
      flash[:success] ="Password chaged successfully"

      redirect_to root_path
    else

      flash[:error] ="The entered password is not same"
      redirect_to password_path


    end

  end

end
