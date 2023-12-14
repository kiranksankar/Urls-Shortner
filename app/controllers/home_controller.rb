
class HomeController < ApplicationController

  def index
    # @url = Url.all


  end

  def navbar

  end



  def about

  end

  def create

    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:register_success] = 'Registered Succesfully'
      redirect_to '/logins'
    else
      flash[:register_error] = user.errors.full_messages
      puts(user.errors.full_messages)
      redirect_to '/recipie'
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
