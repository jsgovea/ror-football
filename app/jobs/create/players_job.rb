class Create::PlayersJob < ApplicationJob
  include GlobalsHelper
  include PlayersHelper
  queue_as :default

  def perform(*args)
    teams = Team.limit(2)
    # Check player per teams
    teams.each do |team|
      players_by_team = Player.where(team_id: team.id)
      if players_by_team.count < 26
        # Take down the current players and loop through the rest
        # In theory, the number of players should be 0
        25.times do
          full_name, country = generate_names(team.league.country.name)
          new_player = Player.new
          new_player.age = rand(18..35)
          new_player.team_id = team.id
          new_player.first_name = full_name[0]['name']
          new_player.last_name = full_name[1]['name']
          new_player.country_id = Country.find_by(name: country).id
          new_player.game_session_id = args[0].id
          new_player.position = PlayersHelper.generate_position(new_player, team)
          new_player.contract_length = rand(1..5)
          new_player.loyalty = rand(55..100)
          new_player.ambition = rand(55..100)

          if new_player.position == "Goalkeeper"
            new_player.gk_positioning = (rand(55..PlayersHelper.set_random_skill(new_player)) * PlayersHelper.league_multiplier(team.league)).to_i
            new_player.gk_diving = (rand(55..PlayersHelper.set_random_skill(new_player)) * PlayersHelper.league_multiplier(team.league)).to_i
            new_player.gk_handling = (rand(55..PlayersHelper.set_random_skill(new_player)) * PlayersHelper.league_multiplier(team.league)).to_i
            new_player.gk_kicking = (rand(55..PlayersHelper.set_random_skill(new_player)) * PlayersHelper.league_multiplier(team.league)).to_i
            new_player.gk_reflexes = (rand(55..PlayersHelper.set_random_skill(new_player)) * PlayersHelper.league_multiplier(team.league)).to_i
          else
            new_player.ball_control = (rand(55..PlayersHelper.set_random_skill(new_player)) * PlayersHelper.league_multiplier(team.league)).to_i
            new_player.dribbling = (rand(55..PlayersHelper.set_random_skill(new_player)) * PlayersHelper.league_multiplier(team.league)).to_i
            new_player.long_pass = (rand(55..PlayersHelper.set_random_skill(new_player)) * PlayersHelper.league_multiplier(team.league)).to_i
            new_player.short_pass = (rand(55..PlayersHelper.set_random_skill(new_player)) * PlayersHelper.league_multiplier(team.league)).to_i
            new_player.heading = (rand(55..PlayersHelper.set_random_skill(new_player)) * PlayersHelper.league_multiplier(team.league)).to_i
            new_player.short_power = (rand(55..PlayersHelper.set_random_skill(new_player)) * PlayersHelper.league_multiplier(team.league)).to_i
            new_player.finishing = (rand(55..PlayersHelper.set_random_skill(new_player)) * PlayersHelper.league_multiplier(team.league)).to_i
            new_player.long_shots = (rand(55..PlayersHelper.set_random_skill(new_player)) * PlayersHelper.league_multiplier(team.league)).to_i
            new_player.aggression = (rand(55..PlayersHelper.set_random_skill(new_player)) * PlayersHelper.league_multiplier(team.league)).to_i
            new_player.composure = (rand(55..PlayersHelper.set_random_skill(new_player)) * PlayersHelper.league_multiplier(team.league)).to_i
            new_player.reactions = (rand(55..PlayersHelper.set_random_skill(new_player)) * PlayersHelper.league_multiplier(team.league)).to_i
            new_player.acceleration = (rand(55..PlayersHelper.set_random_skill(new_player)) * PlayersHelper.league_multiplier(team.league)).to_i
            new_player.stamina = (rand(55..PlayersHelper.set_random_skill(new_player)) * PlayersHelper.league_multiplier(team.league)).to_i
            new_player.strength = (rand(55..PlayersHelper.set_random_skill(new_player)) * PlayersHelper.league_multiplier(team.league)).to_i
            new_player.marking = (rand(55..PlayersHelper.set_random_skill(new_player)) * PlayersHelper.league_multiplier(team.league)).to_i
            new_player.tackling = (rand(55..PlayersHelper.set_random_skill(new_player)) * PlayersHelper.league_multiplier(team.league)).to_i
          end

          new_player.overall = PlayersHelper.generate_overall(new_player, PlayersHelper.set_random_skill(new_player))
          new_player.salary = PlayersHelper.generare_salary(new_player, team.league)
          new_player.potential = PlayersHelper.generate_potential(new_player, team)


          if new_player.save
            puts "Player created"
          else
            puts "Error: #{new_player.position} #{new_player.errors.full_messages.join(', ')}}"
          end
        end
      end
    end
  end

    # Generate player names, nationality and assign to teams
    def generate_names(country)
      mexican_probability = 0
      spanish_probability = 0
      german_probability = 0
      english_probability = 0
      countries = ["Mexico", "Spain", "Germany", "England"]

      case country
      when "Mexico"
        mexican_probability = 0.9
        spanish_probability = 0.0333
        german_probability = 0.0333
        english_probability = 0.0333
      when "Spain"
        mexican_probability = 0.0333
        spanish_probability = 0.9
        german_probability = 0.0333
        english_probability = 0.0333
      when "Germany"
        mexican_probability = 0.0333
        spanish_probability = 0.0333
        german_probability = 0.9
        english_probability = 0.0333
      when "England"
        mexican_probability = 0.0333
        spanish_probability = 0.0333
        german_probability = 0.0333
        english_probability = 0.9
      end

      countries_probability = [mexican_probability, spanish_probability, german_probability, english_probability]
      random_number = rand
      selected_country = nil
      cumulative_probability = 0.0
      countries.each_with_index do |country, index|
        cumulative_probability += countries_probability[index]
        if random_number < cumulative_probability
          selected_country = country
          break
        end
      end

      full_name = PlayersHelper.generate_full_name(selected_country)
      return full_name, selected_country
    end

      # Generate jerser numbers
      # Generate player overall
      # Generate player potential
  end
