class AnswersController < ApplicationController
  before_action :set_answer
  def submit
    it(params[:answer])
    @current_level_xp = current_level_xp
    session[:level_xp] = @current_level_xp + @answer.xp
    @next = @answer.question.next
    if @next
      redirect_to controller: 'questions', action: 'startanswer', id: @next
    else
      redirect_to controller: 'played_levels', action: 'finishlevel',
                  id: current_played_level
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
