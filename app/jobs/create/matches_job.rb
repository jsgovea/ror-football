class Create::MatchesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "Game session id: #{args[0]}"
    game_session = args[0]
    mexican_teams = Team.joins(:league).where(leagues: { name: "Liga Mexicana" })
    spanish_teams = Team.joins(:league).where(leagues: { name: "Liga Española" })
    # germans_teams = Team.joins(:league).where(leagues: { name: "Mexico" })
    # english_teams = Team.joins(:league).where(leagues: { name: "Mexico" })

    mexican_schedule = MatchesHelper.generate_round_robin(mexican_teams, 34)
    spanish_schedule = MatchesHelper.generate_round_robin(spanish_teams, 38)

    mexican_schedule.each do |match_attributes|
      Match.create(match_attributes)
    end

    # germans_schedule = MatchesHelper.generate_round_robin(teams, 34)
    # english_schedule = MatchesHelper.generate_round_robin(teams, 38)

  end
end
