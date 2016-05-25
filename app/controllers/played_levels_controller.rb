class PlayedLevelsController < ApplicationController
  before_action :set_played_level, only: [:close]
  before_action :set_level, only: [:create]

  def create
    @played_level = @level.played_levels.create user: current_user
    session[:played_level_id] = @played_level.id
    redirect_to controller: 'questions', action: 'startanswer',
                id: @level.questions.first.id
  end

  def close
    @played_level.close
    @medals = Medal.all.select { |m| m.judge(current_user, @played_level) }
    set_star_message
  end

  private

  def set_played_level
    @played_level = PlayedLevel.find(params[:id])
  end

  def set_level
    @level = Level.find(params[:level_id])
  end

  def set_star_message
    if @played_level.ended_at < @played_level.level.closed_at
      @starmessage = if @played_level.stars > 0
                       received_star_message
                     else no_star_message
                     end
    else @starmessage = too_late_message
    end
  end

  def received_star_message
    'Gefeliciteerd, je hebt het level binnen de tijd gemaakt! Het aantal' \
    "behaalde sterren is: ' + @played_level.stars.to_s + '.'"
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
