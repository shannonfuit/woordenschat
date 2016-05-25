class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  # used for keeping track of the amount of XP during a level
  def round_xp
    @round_xp ||= session[:level_xp]
  end
end
