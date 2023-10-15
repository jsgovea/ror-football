module PlayersHelper
  def self.generate_full_name(country)
    yaml_data = YAML.load_file("#{Rails.root}/db/seeds/names.yml")
    spanish_first_name = yaml_data['personal_spanish_names']
    spanish_last_name = yaml_data['personal_spanish_last_names']
    english_first_name = yaml_data['personal_english_names']
    english_last_name = yaml_data['personal_english_last_names']
    german_first_name = yaml_data['personal_german_names']
    german_last_name = yaml_data['personal_german_last_names']

    full_name = []
    case country
    when "Mexico"
      full_name = [spanish_first_name.sample, spanish_last_name.sample]
    when "Spain"
      full_name = [spanish_first_name.sample, spanish_last_name.sample]
    when "Germany"
      full_name = [german_first_name.sample, german_last_name.sample]
    when "England"
      full_name = [english_first_name.sample, english_last_name.sample]
    end
    return full_name
  end

  def self.generate_position(player, team)
    positions = {
      "Goalkeeper" => 3,
      "Defender" => 9,
      "Midfielder" => 8,
      "Forward" => 6
    }

    number_of_players = Player.where(team_id: team.id).count
    all_players = Player.where(team_id: team.id)

    if number_of_players < 1
      return positions.keys.sample
    end

    # Check each player position
    if number_of_players < 25
      current_players = 25 - number_of_players
      current_players.times do

      end
      # Check if there is a goalkeeper
      if all_players.where(position: "Goalkeeper").count < 3
        return "Goalkeeper"
      end

      # Check if there is a defender
      if all_players.where(position: "Defender").count < 9
        return "Defender"
      end

      # Check if there is a midfielder
      if all_players.where(position: "Midfielder").count < 8
        return "Midfielder"
      end

      # Check if there is a forward
      if all_players.where(position: "Forward").count < 6
        return "Forward"
      end
    end
  end

  def self.generare_salary(player)
    salary = 0
    # case player.
  end

  def self.generate_skill_value(player)
    skill_ranges = {
      "Mexico" => {
        1..2 => 70..83,
        3..5 => 55..75,
        # 6..10 => 55..70,
      },
      "Spain" => {
        1..2 => 80..90,
        3..5 => 65..85,
        # 6..10 => 65..80,
      },
      "Germany" => {
        1..2 => 82..92,
        3..5 => 65..85,
      },
      "England" => {
        1..2 => 80..95,
        3..5 => 65..85,
      }
    }

    skill_range = skill_ranges[player.country.name]
    # Adjust skill range based on league prestige
    prestige_multiplier = league_prestige / 10.0

     # Calculate the player's skill value within the adjusted skill range
    skill_value = skill_range.find { |range, _| range.include?(league_prestige) }

    if skill_value
      min_skill, max_skill = skill_range[skill_value]
      skill_value = (min_skill..max_skill).to_a.sample
    else
      skill_value = "Prestige out of range"
    end

    return skill_value
  end


  def self.set_random_skill(player)
    country_rate = 0.0

    case player.country.name
    when "Mexico"
      country_rate = 65.0
    when "Spain"
      country_rate = 80.0
    when "Germany"
      country_rate = 85.0
    when "England"
      country_rate = 90.0
    else
      country_rate = 70.0
    end

    return country_rate
  end

  def self.league_multiplier(league)
    league_rate = 0.0
    prestige = league.prestige

    multiplier = case prestige
    when 5
      1.5
    when 4..Float::INFINITY
      1.2
    when -Float::INFINITY..1
      1.0
    else
      1.0
    end

  end
end
