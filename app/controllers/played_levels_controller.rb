class PlayedLevelsController < ApplicationController
  before_action :set_played_level, only: [:show, :edit, :update, :destroy]

  # GET /played_levels
  # GET /played_levels.json
  def index
    @played_levels = PlayedLevel.all
  end

  # GET /played_levels/1
  # GET /played_levels/1.json
  def show
  end

  # GET /played_levels/new
  def new
    @played_level = PlayedLevel.new
  end

  # POST /played_levels
  # POST /played_levels.json
  def create
    @played_level = PlayedLevel.new(played_level_params)

    respond_to do |format|
      if @played_level.save
        format.html { redirect_to @played_level, notice: 'played_level was successfully created.' }
        format.json { render :show, status: :created, location: @played_level }
      else
        format.html { render :new }
        format.json { render json: @played_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /played_levels/1
  # PATCH/PUT /played_levels/1.json
  def update
    respond_to do |format|
      if @played_level.update(played_level_params)
        format.html { redirect_to @played_level, notice: 'played_level was successfully updated.' }
        format.json { render :show, status: :ok, location: @played_level }
      else
        format.html { render :edit }
        format.json { render json: @played_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /played_levels/1
  # DELETE /played_levels/1.json
  def destroy
    @played_level.destroy
    respond_to do |format|
      format.html { redirect_to played_levels_url }
      format.json { head :no_content }
    end
  end

    #this is only redirecting to the first question
  def startlevel
    @level = Level.find(params[:id])
    @question = Question.where(level_id: @level).first
    
    played_level = PlayedLevel.new
    played_level.level = @level
    played_level.user = current_user
    played_level.started_at = Time.zone.now
    played_level.save
    if played_level
      session[:played_level_id] = played_level.id
    end
    redirect_to controller: 'questions', action: 'startanswer', id: @question.id
  end

  def finishlevel
    @played_level = current_played_level
    @played_level.close
    @played_level.save

    user = current_user
    @medals = Medal.all
    @medals_achieved = []
    @medals.each{|medal|
      achieved = medal.judge(user, @played_level)
        if achieved == true
          @medals_achieved.push(medal)
       end
    }
   
    if @played_level.ended_at < @played_level.level.closingdate
      if @played_level.stars > 0
        @starmessage = "Gefeliciteerd, je hebt het level binnen de tijd gemaakt! Het aantal behaalde sterren is: " + @played_level.stars.to_s + "."
      else @starmessage = "Helaas, je hebt geen sterren gehaald in deze ronde. Ik daag je uit, probeer het nog eens!"
      end
    else @starmessage = "Helaas, de deadline voor dit level is verstreken. Je krijgt daarom geen sterren voor deze ronde."
    end

   # redirect_to :controller => "users", :action => "show", :id => current_user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_played_level
      @played_level = PlayedLevel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def played_level_params
      params.require(:played_level).permit(:started_at, :ended_at, :seconds, :level_completed, :stars, :level_id, :user_id, :count_correct, :level_xp)
    end
end
