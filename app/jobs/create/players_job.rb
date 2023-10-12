class Create::PlayersJob < ApplicationJob
  include GlobalsHelper
  include PlayersHelper
  queue_as :default

  def perform(*args)
    teams = Team.all
    # Check player per teams
    teams.each do |team|
      players_by_team = Player.where(team_id: team.id)
      if players_by_team.count < 26
        25.times do
          generate_names(team.league.country.name)
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

      puts "Player data: #{selected_country} #{full_name}"
      # @new_player = Player.new





    end
      # Generate jerser numbers
      # Generate player positions
      # Generate player overall
      # Generate player potential
  end
