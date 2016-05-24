class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  private

  # user after login
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    # if(@current_user == nil)
    # 	redirect_to :controller => 'session', :action => 'log_in'
    # end
  end

  # Level currently played. used as parameter for medals.
  def current_played_level
    @current_played_level ||= PlayedLevel.find(session[:played_level_id]) if session[:played_level_id]
  end

  # used for keeping track of the amount of XP during a level
  def current_level_xp
    @current_level_xp ||= session[:level_xp] if session[:level_xp]
  end
end
