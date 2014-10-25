class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :save_user
  helper_method :current_user

  def save_user
  	@user = User.new
  end

  def current_customer
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

end
