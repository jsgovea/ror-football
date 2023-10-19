class Create::MatchesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    mexican_matches = []
    spanish_matches = []
    puts "Game session id: #{args[0]}"
    game_session = args[0]
    mexican_teams = Team.joins(:league).where(leagues: { name: "Liga Mexicana" })
    spanish_teams = Team.joins(:league).where(leagues: { name: "Liga Española" })
    # germans_teams = Team.joins(:league).where(leagues: { name: "Mexico" })
    # english_teams = Team.joins(:league).where(leagues: { name: "Mexico" })

    mexican_schedule = MatchesHelper.generate_round_robin(mexican_teams, 34)
    spanish_schedule = MatchesHelper.generate_round_robin(spanish_teams, 38)

    schedule = Schedule.new(game_session_id: game_session, season: 2023)
    schedule.save

    mexican_schedule.each do |match_attributes|
      unless match_attributes[:home_team].nil? && match_attributes[:away_team].nil?
        match = Match.new
        match.week = match_attributes[:week]
        match.home_team = match_attributes[:home_team]
        match.away_team = match_attributes[:away_team]
        match.result = 'Not played'
        match.date = match_attributes[:date]
        match.schedule = schedule

        if match.valid?
          match.save
          mexican_matches << match.id
        else
          puts "Invalid match: #{match.errors.full_messages.join(', ')}"
        end
      end
    end

    spanish_matches.each do |match_attributes|
      unless match_attributes[:home_team].nil? && match_attributes[:away_team].nil?
        match = Match.new
        match.week = match_attributes[:week]
        match.home_team = match_attributes[:home_team]
        match.away_team = match_attributes[:away_team]
        match.result = 'Not played'
        match.date = match_attributes[:date]
        match.schedule = schedule

        if match.valid?
          match.save
          spanish_matches << match.id
        else
          puts "Invalid match: #{match.errors.full_messages.join(', ')}"
        end
      end
    end

    schedule.matches = mexican_matches + spanish_matches

    if schedule.valid?
      puts "Schedule updated #{schedule}"
      schedule.save
    else
      puts "Invalid schedule: #{schedule.errors.full_messages.join(', ')}"
    end
  end
end
