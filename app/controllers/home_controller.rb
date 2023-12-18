
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
      redirect_to '/recipie'
    end
  end





  def confirm_email
    user = User.find_by(confirmation_token: params[:token])
    if user
      user.confirm_email
      session[:user_id] = user.id  # Set the session after email confirmation
      flash[:notice] = 'Email confirmed. You can now log in.'
      redirect_to '/logins'
    else
      flash[:alert] = 'Invalid confirmation link.'
      redirect_to root_path
    end
  end




  def register

  end



  
  def count
    @count = Url.count
    puts(@count)
  end


  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
