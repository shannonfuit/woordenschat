class PlayedlevelsController < ApplicationController
  before_action :set_playedlevel, only: [:show, :edit, :update, :destroy]

  # GET /playedlevels
  # GET /playedlevels.json
  def index
    @playedlevels = Playedlevel.all
  end

  # GET /playedlevels/1
  # GET /playedlevels/1.json
  def show
  end

  # GET /playedlevels/new
  def new
    @playedlevel = Playedlevel.new
  end

  # POST /playedlevels
  # POST /playedlevels.json
  def create
    @playedlevel = Playedlevel.new(playedlevel_params)

    respond_to do |format|
      if @playedlevel.save
        format.html { redirect_to @playedlevel, notice: 'Playedlevel was successfully created.' }
        format.json { render :show, status: :created, location: @playedlevel }
      else
        format.html { render :new }
        format.json { render json: @playedlevel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /playedlevels/1
  # PATCH/PUT /playedlevels/1.json
  def update
    respond_to do |format|
      if @playedlevel.update(playedlevel_params)
        format.html { redirect_to @playedlevel, notice: 'Playedlevel was successfully updated.' }
        format.json { render :show, status: :ok, location: @playedlevel }
      else
        format.html { render :edit }
        format.json { render json: @playedlevel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /playedlevels/1
  # DELETE /playedlevels/1.json
  def destroy
    @playedlevel.destroy
    respond_to do |format|
      format.html { redirect_to playedlevels_url }
      format.json { head :no_content }
    end
  end

    #this is only redirecting to the first question
  def startlevel
    @level = Level.find(params[:id])
    @question = Question.find_by_level_id(params[:id])
    
    playedlevel = Playedlevel.new
    playedlevel.level = @level
    playedlevel.user = current_user
    playedlevel.startlevel = Time.now
    playedlevel.save
    if playedlevel
      session[:playedlevel_id] = playedlevel.id
    end
    redirect_to controller: 'questions', action: 'answer', id: @question.id
  end

  def finishlevel
    @playedlevel = current_playedlevel
    @playedlevel.levelfinished
    @playedlevel.save

    if @playedlevel.finishlevel < @playedlevel.level.closingdate
      if @playedlevel.stars > 0
        @starmessage = "gefeliciteerd, je hebt het level binnen de tijd gemaakt. het aantal behaalde sterren is: " + @playedlevel.stars.to_s + "."
      else @starmessage = "helaas, je hebt geen sterren gehaald in deze ronde, ik daag je uit, probeer het nog eens!"
      end
    else @starmessage = "helaas, de deadline voor dit level is verstreken. je krijgt daarom geen sterren voor deze ronde"
    end

   # redirect_to :controller => "users", :action => "show", :id => current_user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playedlevel
      @playedlevel = Playedlevel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def playedlevel_params
      params.require(:playedlevel).permit(:startlevel, :finishlevel, :playtime, :levelcompleted, :stars, :level_id, :user_id, :correctquestions, :levelxp)
    end
end
