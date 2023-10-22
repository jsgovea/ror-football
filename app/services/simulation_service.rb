  class SimulationService
    def start_game(match_data)
      # ActionCable.server.broadcast('simulation_channel', {body: @message})

      # match = Match.find(match_id)
      total_time = 90 + rand(0..5)
      puts "Starting the game #{total_time}"

      match_stats = {
        shots: [0, 0],
        shots_on_target: [0, 0],
        possession: [50, 50], # Initial possession
        pass_accuracy: [0, 0],
        fouls: [0, 0],
        yellow_cards: [0, 0],
        red_cards: [0, 0],
        offsides: [0, 0],
        corners: [0, 0]
      }

      current_time = 0
      while current_time <= total_time
        puts "Current minute: #{current_time}"
        # simulate_events(match_stats, match.home_team, match.away_team)
        current_time += 1
      end

      puts "Match stats: #{match_data}"
      match_stats
    end

    # Test function
    # TODO: Remove this function
    def simulate_events(match_stats, home_team, away_team)
      # Change per player.each skill
      team1_players = team1.players
      team2_players = team2.players

      # Calculate the event probabilities based on player skills
      team1_offensive_strength = team1_players.map { |player| player.skills }.sum
      team2_offensive_strength = team2_players.map { |player| player.skills }.sum

      # Define event probabilities for each event
      # TODO: Pass to individual event simulation functions
      shot_probability_team1 = (team1_offensive_strength - team2_offensive_strength) / 100.0
      shot_probability_team2 = (team2_offensive_strength - team1_offensive_strength) / 100.0

      # Simulate events
      if rand < shot_probability_team1
        match_stats[:shots][0] += 1
        if rand < 0.7 # 70% chance of shot on target
          match_stats[:shots_on_target][0] += 1
        end
      end

      if rand < shot_probability_team2
        match_stats[:shots][1] += 1
        if rand < 0.7 # 70% chance of shot on target
          match_stats[:shots_on_target][1] += 1
        end
      end

      if rand < foul_probability
        fouling_team = rand < 0.5 ? 0 : 1
        match_stats[:fouls][fouling_team] += 1
        if rand < 0.1 # 10% chance of a yellow card
          match_stats[:yellow_cards][fouling_team] += 1
        end
      end

      # Simulate other events (e.g., corners, offsides) in a similar manner
    end

    # Data to consider:
    # - Team offensive, mid and defensive strength
    # - Player skills attributes
    # - Team home/away strength
    # - Latest 5 matches
    # - Team tactics (TODO)
    def generate_shots
    end

    def generate_shots_on_target
    end

    def generate_posession
    end

    def generate_pass_accuracy
    end

    def generate_fouls
    end

    def generate_yellow_cards
    end

    def generate_red_cards
    end

    def generate_offsides
    end

    def generate_corners
    end

    def generate_result
    end
  end
