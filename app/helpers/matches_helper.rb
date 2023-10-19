module MatchesHelper

  def self.generate_round_robin(teams, total_weeks)
    return [] if teams.length < 2

    schedule = []
    played_matches = []
    matches_per_week = teams.length / 2

    (1..total_weeks).each do |current_week|
      shuffled_teams = teams.shuffle

      for _ in 0..matches_per_week
        home_team = shuffled_teams.shift
        away_team = shuffled_teams.pop

        if home_team && away_team
          home_match = {
            week: current_week,
            home_team: home_team,
            away_team: away_team,
            result: 'Not played',
            date: get_next_saturday(current_week)
          }
          schedule << home_match
        end

      end
    end

    (total_weeks / 2..total_weeks).each do |current_week|
      for i in 0..matches_per_week
        home_team = schedule[(current_week - 1) * matches_per_week + i][:away_team]
        away_team = schedule[(current_week - 1) * matches_per_week + i][:home_team]

        if home_team && away_team
        away_match = {
          week: current_week,
          home_team: home_team,
          away_team: away_team,
          result: 'Not played',
          date: get_next_saturday(current_week)
        }

        schedule << away_match
      end
      end
    end

    return schedule
  end

  def self.get_next_saturday(current_week)
    current_date = Date.current.beginning_of_day
    while current_date.wday != 6
      current_date += 1.day
    end
    days_to_add = (current_week - 1) * 7
    current_date + days_to_add.days
  end
end
