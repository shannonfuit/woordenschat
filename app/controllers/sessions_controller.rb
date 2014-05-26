class SessionsController < ApplicationController
	def new
	end

	def create
	  user = User.authenticate(params[:acro], params[:password])
	  if user
	    session[:user_id] = user.id
	   # redirect_to root_url, :notice => "Logged in!"
	   	redirect_to :controller => "users", :action => "show", :id => "user.id"
	  else
	    flash.notice = "Ongeldige acro of wachtwoord"
	    render "new"
	  end
	end

	def destroy
	  session[:user_id] = nil
	 redirect_to root_url
	 #redirect_to :controller => "levels", :action => "startlevel", :id => "1", :notice => "Logged out!"
	end
end