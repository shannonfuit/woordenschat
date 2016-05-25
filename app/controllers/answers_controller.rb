class AnswersController < ApplicationController
  before_action :set_answer
  def submit
    @answer.submit(params[:answer])
    @round_xp = round_xp
    session[:level_xp] = @round_xp + @answer.xp
    @next_question = @answer.question.next
    if @next_question
      redirect_to question_path(@next_question, round_id: @answer.round.id )
    else
      redirect_to controller: 'rounds', action: 'close',
                  id: @answer.round.id
    end
  end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:given_answer, :correct_answered,
                                   :used_semantic_hint, :used_sentence_hint,
                                   :used_image_hint, :level, :question_id)
  end
end
