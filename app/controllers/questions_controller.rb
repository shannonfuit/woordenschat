class QuestionsController < ApplicationController
  before_action :set_question
  before_action :set_round, only: [:show]

  def show
    unless @round.answers.empty?
      flash[:notice] = if @round.answers.last.correct_answered?
                         'Goed beantwoord!'
                       else
                         'Fout beantwoord!'
                       end
    end
    @answer = @round.answers.create(
      question: @question,
      user: current_user
    )
    #TODO: Use decorators, 
    @round_xp = @round.answers.sum(:xp)
    @current_answer_number = @round.answers.count
  end

  def submit
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

    redirect_to controller: 'questions', action: 'show', id: question.id, answerid: answer.id
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Question.find(params[:id])
  end

  def set_round
    @round = Round.find(params[:round_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def question_params
    params.require(:question).permit(:word, :ans1, :ans2, :ans3, :ans4, :hintsemantic, :hintsentence, :hintimage, :anscorrect, :level_id)
  end
end
