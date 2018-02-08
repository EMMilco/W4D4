class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(login_params[:email], login_params[:password])
    if user.nil?
      flash[:errors] = ["incorrect email and/or password"]
      redirect_to new_session_url

    else
      login_user!(user)
      redirect_to user_url(user.id)
    end
  end

  def destroy
    session[:session_token] = nil
    redirect_to new_session_url
  end

private

  def login_params
    params.require(:login).permit(:email, :password)
  end
end
