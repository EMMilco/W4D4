class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def login_user!(user)
    session[:session_token] = user.reset_session_token!
  end

  def current_user
    User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def ensure_logged_in
    unless logged_in?
      redirect_to root_url
    end
  end
end
