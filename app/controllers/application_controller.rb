class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


	helper_method :current_user

	private

	def current_user
	  @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
	  # if(@current_user == nil)
	  # 	redirect_to :controller => 'session', :action => 'log_in'
	  # end
	end

	def current_playedlevel
	  @current_playedlevel ||= Playedlevel.find(session[:playedlevel_id]) if session[:playedlevel_id]
	end
  
  	def current_levelxp
	  @current_levelxp ||= session[:levelxp] if session[:levelxp]
	end
  
end
