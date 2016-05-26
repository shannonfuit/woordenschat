class RoundsController < ApplicationController
  before_action :set_round, only: [:close]
  before_action :set_level, only: [:create]

  def create
    @round = @level.rounds.create user: current_user
    session[:round_id] = @round.id
    redirect_to question_path(@level.questions.first, round_id: @round.id )
  end

  def close
    @round.close
    @medals = Medal.all.select { |m| m.judge(current_user, @round) }
    set_star_message
  end

  private

  def set_round
    @round = Round.find(params[:id])
  end

  def set_level
    @level = Level.find(params[:level_id])
  end

  def set_star_message
    if @round.ended_at < @round.level.closed_at
      @starmessage = if @round.stars > 0
                       received_star_message
                     else no_star_message
                     end
    else @starmessage = too_late_message
    end
  end
  
  # TODO: NO! this does not belong here. reminder to use i18n!

  def received_star_message
    'Gefeliciteerd, je hebt het level binnen de tijd gemaakt! Het aantal' \
    "behaalde sterren is: ' + @round.stars.to_s + '.'"
  end

  def no_star_message
    'Helaas, je hebt geen sterren gehaald in deze ronde. Ik daag je uit, ' \
    'probeer het nog eens!'
  end

  def too_late_message
    'Helaas, de deadline voor dit level is verstreken. Je krijgt daarom geen ' \
    'sterren voor deze ronde.'
  end
end
