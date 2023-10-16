class GameSessionsController < ApplicationController
  # Show new formulary to create a new game session
  def new
    @game_session = GameSession.new
    Create::CountriesJob.perform_now()
    Create::LeaguesJob.perform_now()
    Create::TeamsJob.perform_now()
    @leagues = League.all
    @teams = Team.all
    @user = current_user
    puts "Current user - #{@user}"
  end

  # Show all game sessions
  def show
    @my_game_sessions = GameSession.where(user_id: current_user.id)
  end

  # Create a new game session
  def create
    @user = current_user
    @game_session = GameSession.new(session_params)

    if @game_session.save
      Create::PlayersJob.perform_now(@game_session)
      puts "Game session created"
      redirect_to play_home_index_path, notice: 'Game session was successfully created.'
    else
      puts "Validation errors: #{@game_session.errors.full_messages.join(', ')}"
    end
  end

  private
  def session_params
    params.require(:game_session).permit(:team_id).merge(user_id: current_user.id, current_year: 2024, current_date: DateTime.now, last_time_played: DateTime.now)
  end
end
