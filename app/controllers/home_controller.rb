
class HomeController < ApplicationController

  def index
    # @url = Url.all


  end

  def navbar

  end



  def about

  end

  def create

    @user = User.new(user_params)

    if @user.save
      # @user.generate_confirmation_token
      UserMailer.confirmation_email(@user).deliver_now

      redirect_to root_path, notice: 'Please check your email to confirm your account.'
      # session[:user_id] = @user.id
      # flash[:register_success] = 'Registered Succesfully'
      # redirect_to '/recipie'
      # redirect_to root_path
    else
      flash[:register_error] = @user.errors.full_messages
      # puts(user.errors.full_messages)
      # redirect_to root_path
      redirect_to '/register'
    end
  end





  def confirm_email
    puts("++++++++++++++++++:::::::::::")
    user = User.find_by(confirmation_token: params[:token])
    # # puts(user.password_digest)
    # puts(user.username)
    # puts(user.confirmation_token)
    # puts(user.email)


    if user

      user.assign_attributes(email_confirmed: true, confirmation_token: "confirmed")

        puts(user.email_confirmed)

        puts(user.attributes)

        if user.save(validate: false)


          session[:user_id] = user.id

          flash[:notice] = 'Email confirmed. You can now log in.'

          redirect_to logins_path

        else

          flash[:alert] = 'Failed to confirm email. Please try again.'
          redirect_to root_path


        end


    else

      flash[:alert] = 'Invalid confirmation link.'
      redirect_to root_path

    end

  end





  def register

  end



  def count

    @user = current_user

    @user_urls = @user.urls

    @count = @user_urls .count

    puts(@count)
  end


  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
