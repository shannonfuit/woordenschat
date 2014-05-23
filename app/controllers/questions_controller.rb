class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
   before_action :set_user, only: [:answer]

  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was succesvol aangemaakt.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Vraag is succesvol aangepast.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end

  #added methods
  def startanswer
    @question= Question.find(params[:id])  
    @next = @question.next
    @answer = Answer.new
    @answer.question = @question
    @answer.questionstarted = Time.now
    @answer.user = current_user
    @answer.save
    session[:answer_id] = @answer.id

    redirect_to controller: 'questions', action: 'showanswer', id: @question.id, answerid: @answer.id
  end

  #shows page where user can answer the question
  def showanswer
    @question= Question.find(params[:id])
    @next = @question.next
    @answer = Answer.find(params[:answerid])
    @current_playedlevel = current_playedlevel
    @current_user = current_user
    @current_levelxp = current_levelxp

    @time = @answer.questionstarted
    @seconds_left = (@time - Time.now + 90).to_i

  end

  def usedhints
    question= Question.find(params[:id])
    answer = Answer.find(params[:answerid])
    hint = params[:hintid]

    if hint == "hintsemanticused"
      answer.hintsemanticused = true
    elsif hint == "hintsentenceused"
      answer.hintsentenceused = true
    elsif hint == "hintimageused"
      answer.hintimageused = true
    end
    answer.save

    redirect_to controller: 'questions', action: 'showanswer', id: question.id, answerid: answer.id
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    def set_user
      @user = @current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:word, :ans1, :ans2, :ans3, :ans4, :hintsemantic, :hintsentence, :hintimage, :anscorrect, :level_id)
    end
end
