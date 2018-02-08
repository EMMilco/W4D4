class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save
      login_user!(user)
      redirect_to user_url(user)
    else
      flash[:errors] = ["email and/or password invalid, please choose again"]
      redirect_to new_user_url
    end
  end


private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
