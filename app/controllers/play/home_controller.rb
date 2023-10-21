class Play::HomeController < ApplicationController
  def index
    @current_game_session = GameSession.where(user_id: current_user.id).last
    @schedule = Schedule.find_by(game_session_id: @current_game_session.id)
    @matches = Match.where(schedule_id: @schedule.id)

    puts "Schedule: #{@matches.inspect}"
  end

  def show
  end
end
