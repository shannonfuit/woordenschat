class QuestionsController < ApplicationController
  before_action :set_question

  #TODO: this should be in answer create
  def startanswer
    @current_round = current_round
    @next = @question.next
    @answer = @current_round.answers.create(
      question: @question,
      user: current_user
    )
    session[:answer_id] = @answer.id

    unless @current_round.answers.last.nil?
      flash[:notice] = if @current_round.answers.last.correct_answered?
                         'Goed beantwoord!'
                       else
                         'Fout beantwoord!'
                       end
    end
    redirect_to controller: 'questions', action: 'showanswer', id: @question.id, answerid: @answer.id
  end

  # shows page where user can answer the question
  def showanswer
    @next = @question.next
    @answer = Answer.find(params[:answerid])
    @current_round = current_round
    @current_user = current_user
    @current_level_xp = current_level_xp
    @current_answer_number = @current_round.answers.count + 1

    @seconds_left = (@answer.created_at - Time.now).to_int.abs
  end

  def usedhints
    question = Question.find(params[:id])
    answer = Answer.find(params[:answerid])
    hint = params[:hintid]

    if hint == 'used_semantic_hint'
      answer.used_semantic_hint = true
    elsif hint == 'used_sentence_hint'
      answer.used_sentence_hint = true
    elsif hint == 'used_image_hint'
      answer.used_image_hint = true
    end
    answer.save

    redirect_to controller: 'questions', action: 'showanswer', id: question.id, answerid: answer.id
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Question.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def question_params
    params.require(:question).permit(:word, :ans1, :ans2, :ans3, :ans4, :hintsemantic, :hintsentence, :hintimage, :anscorrect, :level_id)
  end
end
