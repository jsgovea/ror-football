class GameSessionsController < ApplicationController
  # Show new formulary to create a new game session
  def index
    @game_session = GameSession.new
    Create::CountriesJob.perform_now()
    Create::LeaguesJob.perform_now()
    Create::TeamsJob.perform_now()
    @leagues = League.all
    @teams = Team.all
  end

  # Show all game sessions
  def show
  end

  # Create a new game session
  def create

  end
end
