class SessionController < ApplicationController

  def create
    user = User.find_by(email:login_params[:email])

    if user && user.authenticate(login_params[:password])
      
      if user.email_confirmed


        session[:user_id] = user.id
        flash[:login_success] = 'Logined Successfully'
        redirect_to '/count'

      else

      flash[:login_error] = 'Please verify your email before logging in.'
      redirect_to '/logins'

      end
    else
      flash[:login_error] = 'invalid credentials please check the Email and Password'
      redirect_to '/logins'
    end

  end

  def destroy
    session[:user_id] = nil

    redirect_to root_path, notice: "Logged out successfully"
  end






  private
    def login_params
      params.require(:login).permit(:email, :password)

    end
end
