class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def authorize
    if !current_user
      flash[:alert] = "You aren't authorized to visit that page."
      redirect_to '/'
    end
  end

  def admin_authorize
    if current_user && !current_user.admin
      flash[:alert] = "You aren't authorized to visit that page."
      redirect_to '/'
    end
  end

end
