class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  def index
    @users = User.all
  end

  def show
  end

  def edit
  end



  def new
    @user = User.new
  end

  def create

    @user = User.new(user_params)
    #raise params.inspect
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end


  private
  def set_user
      @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:acro, :password_hash, :password_salt, :password)
  end

end