class Play::SimulationController < ApplicationController
  def index
    # Get current week
    # Get the user's team
    # Simulate the match
    # Simulate the rest of the week of all matches
    @message = "Hello world"
    current_game_session = GameSession.find_by(user_id: current_user.id)
    current_week = current_game_session.week
    current_team = Team.find(current_game_session.team_id)

    team_match = Match.where(week: current_week, home_team_id: current_team.id).or(Match.where(week: current_week, away_team_id: current_team.id))

    SimulationService.new.start_game(team_match)
  end

  def show
  end
end
