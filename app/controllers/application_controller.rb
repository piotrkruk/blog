class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :authorize

  private
  	def current_user
  		@current_user ||= User.find(session[:user_id]) if session[:user_id]
  	end

  	def authorize
  		if current_user == nil
  			redirect_to log_in_path(r:params), :notice => "You must log in to access this content"
  		end
  	end
end
