class UsersController < ApplicationController
  before_action :set_user, only: [ :edit, :update, :destroy]


  def index
    @users = User.all
  end

  def show
    @user = current_user
    @user.xp = @user.totalxp
    @user.save
    @gebruikers = User.all.order('xp DESC').take(5)
    @levels = Level.all
    @lvlscores = Hash.new
    @levels.each { |lvl|
      @lvlscores[lvl] = 0
      if !(@user.playedlevels.nil? && @user.playedlevels.empty?) then
        bestlevel = @user.playedlevels.select{ | pl | pl.level_id == lvl.id }.max_by(&:stars)
        
        if bestlevel != nil then
          @lvlscores[lvl] = bestlevel.stars
        end
      end 
    }
  end

  def edit
  end

  def update
    @user = current_user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'uw avatar is veranderd' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
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
    params.require(:user).permit(:klas, :name, :picture, :xp, :acro, :password_hash, :password_salt, :password)
  end

end