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

  # GET /answers/1/edit
  def edit
    @answer = Answer.find(params[:answer_id])
    @answer.answer(params[:answer])
    @answer.save
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.find(params[:answer_id])
    @answer.answer(params[:answer])
   # @answer.question = Question.find(params[:question_id])
   # @answer.questionfinished = Time.now
    #logger.debug "Q started: " + @answer.questionstarted
    #@answer.answer(params[:answer])
    # @answer.givenanswer = params[:answer]#params[:givenanswer]
    # # move to answer object
    # @answer.answercorrect = (@answer.givenanswer == @answer.question.correctAns)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to @answer, notice: 'Answer was successfully created.' }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
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