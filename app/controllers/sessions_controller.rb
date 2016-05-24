class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(acro: params[:acro])
    if user.nil?
      flash.notice = 'Acro niet bekend'
      render 'new'
    elsif user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to controller: 'users', action: 'show', id: 'user.id'
    else
      flash.notice = 'Wachtwoord onjuist'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
    # redirect_to :controller => "levels", :action => "startlevel", :id => "1", :notice => "Logged out!"
  end
end
