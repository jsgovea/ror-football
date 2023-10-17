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

  def self.generate_overall(player, country_rate)
    # TODO: Chage weights for each position
    weights = {}
    overall = 0.0
    weighted_sum = 0

    # if player.position == "Goalkeeper"
    #   weights = {
    #     gk_positioning: 0.2,
    #     gk_diving: 0.2,
    #     gk_handling: 0.2,
    #     gk_kicking: 0.2,
    #     gk_reflexes: 0.2
    #   }
    # else
    #   weights = {
    #     ball_control: 0.1,
    #     dribbling: 0.1,
    #     long_pass: 0.05,
    #     short_pass: 0.1,
    #     heading: 0.05,
    #     short_power: 0.05,
    #     finishing: 0.1,
    #     long_shots: 0.05,
    #     aggression: 0.05,
    #     composure: 0.05,
    #     reactions: 0.1,
    #     acceleration: 0.05,
    #     stamina: 0.05,
    #     strength: 0.05,
    #     sprint_speed: 0.05,
    #     marking: 0.05,
    #     tackling: 0.1
    #   }
    # end

    if player.position == "Goalkeeper"
      weights = [
        1.5, # gkPositioning
        1.5, # gkDiving
        1.5, # gkHandling
        1.5, # gkKicking
        1.5, # gkReflexes
      ]
    else
      weights = [
      0.1, # ball_control
      0.1, # dribbling
      0.05, # long_pass
      0.1, # short_pass
      0.05, # heading
      0.05, # short_power
      0.1, # finishing
      0.05, # long_shots
      0.05, # aggression
      0.05, # composure
      0.1, # reactions
      0.05, # acceleration
      0.05, # stamina
      0.05, # strength
      0.05, # sprint_speed
      0.05, # marking
      0.1 # tackling
      ]
    end

    if player.position == "Goalkeeper"
      weighted_sum = weights.zip([
        player.gk_positioning, player.gk_diving, player.gk_handling, player.gk_kicking, player.gk_reflexes
      ]).map { |(weight, skill_value)|
        skill_value.nil? ? 0 : weight * skill_value.to_i
      }.sum
    else
      weighted_sum = weights.zip([
        player.ball_control, player.dribbling, player.long_pass, player.short_pass, player.heading, player.short_power,
        player.finishing, player.long_shots, player.aggression, player.composure, player.reactions, player.acceleration,
        player.stamina, player.strength, player.sprint_speed, player.marking, player.tackling
      ]).map { |(weight, skill_value)|
        weight * skill_value.to_i
      }.sum
    end

    overall_rating = weighted_sum / weights.size

    return overall_rating = [ [overall_rating, country_rate].min, rand(55..75)].max

  end

  def self.generare_salary(player, league)
    salary = 0
    salary = player.overall * self.league_multiplier(league) * self.set_random_skill(player) * 1000 * 0.1
    return salary.round
  end

  def self.overall_multiplier(overall)
    if overall >= 90
      return 1.2
    elsif overall >= 80
      return 1.1
    elsif overall >= 70
      return 1.0
    elsif overall >= 60
      return 0.9
    else
      return 0.8
    end
  end

  def self.get_nationality_multiplier(player)
    case player.country.name
    when "Mexico"
      rand(1.0..1.3)
    when "Spain"
      rand(1.0..1.4)
    when "Germany"
      rand(1.0..1.5)
    when "England"
      rand(1.0..1.6)
    else
      1.0
    end
  end

  def self.generate_potential(player, team)
    nationality_weight = 0.7
    league_weight = 0.3
    nationality_multiplier = get_nationality_multiplier(player)
    league_multiplier = league_multiplier(team.league)
    country_rate = set_random_skill(player)

    potential = (
      (nationality_multiplier * nationality_weight) +
      (league_multiplier * league_weight)
    ) * player.overall
    return potential.round
  end

  def self.calculate_salary(player, team)
    nationality_multiplier = get_nationality_multiplier(player)
    league_multiplier = league_multiplier(team.league)
    base_salary = 50000
    salary = base_salary
    nationality_weight = 0.2
    overall_weight = 0.3
    potential_weight = 0.2
    league_prestige_weight = 0.3

    salary = base_salary +
    base_salary * nationality_multiplier * nationality_weight +
    base_salary * (player.overall / 100.0) * overall_weight +
    base_salary * (player.potential / 100.0) * potential_weight +
    base_salary * (league_multiplier / 100.0) * league_prestige_weight

    return salary.round
  end

  def self.calculate_transfer_value(player)
    base_value = 10_000_00

    case player.country.name
    when "Mexico"
      base_value *= 2
    when "Spain"
      base_value *= 7
    when "Germany"
      base_value *= 8
    when "England"
      base_value *= 10
    end

    value = base_value * (player.overall + player.potential) / 200
    value = [value, 10_000_000].max
    return value
  end

end
