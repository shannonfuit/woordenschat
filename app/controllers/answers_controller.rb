class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # POST /answers
  # POST /answers.json
  def finishquestion
    @answer = Answer.find(params[:answer_id])
    @answer.finishquestion(params[:answer])
    @answer.playedlevel = current_playedlevel
    @next = @answer.question.next
    @answer.save
    @current_levelxp = current_levelxp
    session[:levelxp] = @current_levelxp + @answer.xp

    respond_to do |format|
      if @next != nil
          format.html { redirect_to :controller => "questions", :action => "startanswer",:id => @next}
          format.json { head}
      else
        format.html { redirect_to :controller => "playedlevels", :action => "finishlevel", :id => current_playedlevel}
        format.json { head }
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:givenanswer, :answercorrect, :hintsemanticused, :hintsentenceused, :hintimageused, :xp, :questionstarted, :questionfinished, :playtime, :level, :question_id)
    end
end
